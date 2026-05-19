import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';
import '../../data/api/gemini_service.dart';
import '../../data/repositories/chat_repository.dart';
import '../../data/repositories/administrative_unit_repository.dart';
import '../models/chat_message.dart';
import '../models/chat_context.dart';
import 'timeline_provider.dart';
import 'map_provider.dart';

final chatMessagesProvider = StreamProvider<List<ChatMessage>>((ref) {
  final repo = ref.watch(chatRepositoryProvider);
  return repo.watchMessages();
});

final currentChatContextProvider = FutureProvider<ChatContext>((ref) async {
  final year = ref.watch(selectedYearProvider);
  final era = ref.watch(currentEraProvider);
  final provinceCount = ref.watch(currentProvinceCountProvider);
  final selectedMa = ref.watch(selectedProvinceProvider);
  
  String? embedText;
  if (selectedMa != null) {
    final repo = ref.watch(administrativeUnitRepositoryProvider);
    final unit = await repo.getUnitByMa(selectedMa);
    embedText = unit?.embedText;
  }

  return ChatContext(
    currentYear: year,
    selectedProvinceMa: selectedMa,
    selectedProvinceEmbedText: embedText,
    provinceCount: provinceCount,
    currentEra: era.label,
  );
});

final suggestedQuestionsProvider = FutureProvider<List<String>>((ref) async {
  final context = await ref.watch(currentChatContextProvider.future);
  final gemini = ref.watch(geminiServiceProvider);
  return gemini.generateSuggestedQuestions(context);
});

final chatNotifierProvider = StateNotifierProvider<ChatNotifier, List<ChatMessage>>((ref) {
  final gemini = ref.watch(geminiServiceProvider);
  final repo = ref.watch(chatRepositoryProvider);
  return ChatNotifier(gemini, repo, ref);
});

class ChatNotifier extends StateNotifier<List<ChatMessage>> {
  final GeminiService _geminiService;
  final ChatRepository _repository;
  final Ref _ref;
  final _uuid = const Uuid();

  ChatNotifier(this._geminiService, this._repository, this._ref) : super([]) {
    // Initial load from db stream is handled by chatMessagesProvider
    // but we can hold temporary in-memory state here for streaming
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    final userMessage = ChatMessage(
      id: _uuid.v4(),
      role: MessageRole.user,
      content: text,
      timestamp: DateTime.now(),
    );

    // Save user message to DB
    await _repository.saveMessage(userMessage);

    final aiMessageId = _uuid.v4();
    var aiMessage = ChatMessage(
      id: aiMessageId,
      role: MessageRole.assistant,
      content: '',
      timestamp: DateTime.now(),
      isStreaming: true,
    );

    // Add empty AI message to local state for streaming UI
    state = [...state, aiMessage];

    try {
      final chatContext = await _ref.read(currentChatContextProvider.future);
      final stream = _geminiService.sendMessage(text, context: chatContext);

      String accumulatedContent = '';
      
      await for (final chunk in stream) {
        accumulatedContent += chunk;
        
        // Update local state for streaming UI
        state = [
          ...state.where((m) => m.id != aiMessageId),
          aiMessage.copyWith(content: accumulatedContent)
        ];
      }

      // Finalize and save to DB
      final finalMessage = aiMessage.copyWith(
        content: accumulatedContent, 
        isStreaming: false,
      );
      
      state = state.where((m) => m.id != aiMessageId).toList(); // Remove temp stream message
      await _repository.saveMessage(finalMessage); // DB will push via chatMessagesProvider
      
    } catch (e) {
      // Handle error
      state = state.where((m) => m.id != aiMessageId).toList();
      await _repository.saveMessage(
        ChatMessage(
          id: _uuid.v4(),
          role: MessageRole.assistant,
          content: 'Lỗi: Không thể kết nối với AI. ($e)',
          timestamp: DateTime.now(),
        ),
      );
    }
  }

  Future<void> clearHistory() async {
    await _repository.clearHistory();
    state = [];
  }
}
