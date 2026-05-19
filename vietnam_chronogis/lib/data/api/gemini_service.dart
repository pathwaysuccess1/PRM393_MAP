import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import '../../shared/models/chat_context.dart';

final geminiServiceProvider = Provider<GeminiService>((ref) {
  // Use environment variable, fallback to user provided key if not set
  const apiKey = String.fromEnvironment(
    'GEMINI_API_KEY',
    defaultValue: 'AIzaSyCXF24oqMc47y62oOTdjXQKCjs419ZPMqE', 
  );
  
  if (apiKey.isEmpty) {
    throw Exception('GEMINI_API_KEY is not set');
  }

  return GeminiService(apiKey);
});

class GeminiService {
  final GenerativeModel _model;

  GeminiService(String apiKey)
      : _model = GenerativeModel(
          model: 'gemini-2.0-flash',
          apiKey: apiKey,
          systemInstruction: Content.system('''
Bạn là một chuyên gia lịch sử địa lý hành chính Việt Nam cho ứng dụng Vietnam ChronoGIS.

Kiến thức nền:
- Việt Nam thống nhất năm 1975, tái cấu trúc hành chính 1976 (61→38 tỉnh)
- Đổi Mới 1986: chuyển sang kinh tế thị trường
- 1991-1997: Tách tỉnh để quản lý phân cấp (38→61 tỉnh)
- 2008: Hà Nội sáp nhập Hà Tây, mở rộng gấp đôi
- 2025: Nghị quyết 202/2025/QH15 sáp nhập 63→34 tỉnh/thành

Trả lời ngắn gọn, chính xác, bằng ngôn ngữ người dùng hỏi.
Khi đề cập sự kiện, nêu rõ năm và số hiệu nghị quyết nếu có.
'''),
          generationConfig: GenerationConfig(
            maxOutputTokens: 1024,
            temperature: 0.7,
          ),
        );

  Stream<String> sendMessage(String message, {required ChatContext context}) {
    final prompt = _buildPrompt(message, context);
    
    // We maintain a simple historyless chat since each query gets full context
    // If you want conversational memory, use startChat() instead of generateContentStream
    return _model.generateContentStream([Content.text(prompt)]).map((chunk) {
      return chunk.text ?? '';
    });
  }

  Future<List<String>> generateSuggestedQuestions(ChatContext context) async {
    final prompt = '''
Tạo 4 câu hỏi gợi ý ngắn gọn cho người dùng về lịch sử hành chính Việt Nam.
Context hiện tại:
- Năm đang xem: ${context.currentYear} (${context.currentEra})
- Số tỉnh: ${context.provinceCount}
${context.selectedProvinceEmbedText != null ? '- Đang chọn: ${context.selectedProvinceEmbedText}' : ''}

Trả lời dưới dạng JSON array, ví dụ: ["Câu 1", "Câu 2", "Câu 3", "Câu 4"]
Chỉ trả về JSON, không thêm text khác.
''';

    try {
      final response = await _model.generateContent([Content.text(prompt)]);
      final text = response.text ?? '[]';
      // Basic cleanup in case of markdown formatting
      final cleanText = text.replaceAll('```json', '').replaceAll('```', '').trim();
      
      // Simple parse, assuming well-formed response
      final regex = RegExp(r'"([^"]*)"');
      final matches = regex.allMatches(cleanText);
      final questions = matches.map((m) => m.group(1)!).take(4).toList();
      
      if (questions.isNotEmpty) return questions;
    } catch (e) {
      // Fallback
    }

    // Default suggestions if API fails
    return [
      if (context.selectedProvinceMa != null) 
        'Quá trình sáp nhập của tỉnh này diễn ra như thế nào?',
      'Năm ${context.currentYear} có sự kiện hành chính nào nổi bật?',
      'Tại sao có sự thay đổi số lượng tỉnh thành vào thời điểm này?',
      'Giai đoạn ${context.currentEra} mang ý nghĩa gì?',
    ];
  }

  String _buildPrompt(String userMessage, ChatContext context) {
    return '''
Context hệ thống hiện tại:
- Năm đang xem trên bản đồ: ${context.currentYear}
- Giai đoạn: ${context.currentEra}
- Số lượng tỉnh thành: ${context.provinceCount}
${context.selectedProvinceEmbedText != null ? '- Tỉnh đang được chọn:\n${context.selectedProvinceEmbedText}' : '- Không có tỉnh nào được chọn.'}

Câu hỏi của người dùng:
$userMessage
''';
  }
}
