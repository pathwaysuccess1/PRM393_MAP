import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../shared/providers/chat_provider.dart';
import 'widgets/chat_message_bubble.dart';
import 'widgets/chat_input_bar.dart';
import '../../shared/models/chat_message.dart';

class AiInsightsScreen extends ConsumerStatefulWidget {
  const AiInsightsScreen({super.key});

  @override
  ConsumerState<AiInsightsScreen> createState() => _AiInsightsScreenState();
}

class _AiInsightsScreenState extends ConsumerState<AiInsightsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Watch messages from local DB
    final messagesAsync = ref.watch(chatMessagesProvider);
    // Watch temp messages from provider (for streaming)
    final tempMessages = ref.watch(chatNotifierProvider);

    return Scaffold(
      backgroundColor: const Color(0xFF12151C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1D23),
        title: const Text('Phân tích AI', style: TextStyle(color: Colors.white, fontSize: 18)),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              ref.read(chatNotifierProvider.notifier).clearHistory();
            },
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: messagesAsync.when(
              data: (dbMessages) {
                // Combine DB messages and temp streaming messages
                // We assume tempMessages only contains the current streaming message
                // However, they might overlap. A better approach is to merge them based on ID.
                // For simplicity, if tempMessages has a streaming message, we append it.
                
                List<ChatMessage> displayMessages = [...dbMessages];
                for (var tempMsg in tempMessages) {
                  if (tempMsg.isStreaming) {
                    displayMessages.add(tempMsg);
                  }
                }

                if (displayMessages.isEmpty) {
                  return _buildEmptyState();
                }

                // Scroll to bottom when new messages arrive
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _scrollToBottom();
                });

                return ListView.builder(
                  controller: _scrollController,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  itemCount: displayMessages.length,
                  itemBuilder: (context, index) {
                    return ChatMessageBubble(message: displayMessages[index]);
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) => Center(child: Text('Lỗi: $e', style: const TextStyle(color: Colors.red))),
            ),
          ),
          const ChatInputBar(),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.history_edu, size: 64, color: Colors.white.withValues(alpha: 0.2)),
          const SizedBox(height: 16),
          Text(
            'Hỏi AI về lịch sử hành chính Việt Nam',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.5),
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 24),
          _buildSuggestionChips(),
        ],
      ),
    );
  }

  Widget _buildSuggestionChips() {
    final suggestionsAsync = ref.watch(suggestedQuestionsProvider);
    
    return suggestionsAsync.when(
      data: (suggestions) {
        return Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: suggestions.map((text) {
            return ActionChip(
              backgroundColor: const Color(0xFF1E2128),
              side: BorderSide(color: Colors.white.withValues(alpha: 0.1)),
              label: Text(text, style: TextStyle(color: Colors.white.withValues(alpha: 0.8), fontSize: 13)),
              onPressed: () {
                ref.read(chatNotifierProvider.notifier).sendMessage(text);
              },
            );
          }).toList(),
        );
      },
      loading: () => const CircularProgressIndicator(),
      error: (_, _) => const SizedBox.shrink(),
    );
  }
}
