import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_gemini/providers/api_key_provider.dart';

part 'chat_provider.g.dart';

@Riverpod(keepAlive: true)
ChatSession chatSession(ChatSessionRef ref) {
  return GenerativeModel(
    model: 'gemini-pro',
    apiKey: ref.watch(apiKeyProvider) ?? '',
  ).startChat();
}

@riverpod
class ChatMessage extends _$ChatMessage {
  @override
  Future<String> build() async {
    return '';
  }

  Future<void> send(String text) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      final res =
          await ref.read(chatSessionProvider).sendMessage(Content.text(text));
      if (res.text == null) {
        throw Exception('Empty response');
      }
      return res.text!;
    });
    if (state is! AsyncError) {
      ref.invalidate(chatContentsProvider);
    }
  }
}

@riverpod
List<ChatContent> chatContents(ChatContentsRef ref) {
  return ref
      .watch(chatSessionProvider)
      .history
      .map((content) => ChatContent.fromContent(content))
      .toList();
}

class ChatContent {
  final String role;
  final String text;

  ChatContent(this.role, this.text);

  factory ChatContent.fromContent(Content content) {
    return ChatContent(
      content.role ?? '',
      content.parts.whereType<TextPart>().map<String>((e) => e.text).join(''),
    );
  }
}
