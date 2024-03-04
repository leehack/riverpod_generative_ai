import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_gemini/providers/chat_provider.dart';
import 'package:riverpod_gemini/widgets/chat_item_widget.dart';

class ChatListWidget extends ConsumerStatefulWidget {
  const ChatListWidget({super.key});

  @override
  ConsumerState<ChatListWidget> createState() => _ChatListWidgetState();
}

class _ChatListWidgetState extends ConsumerState<ChatListWidget> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 750),
        curve: Curves.easeOutCirc,
      ),
    );
    final List<ChatContent> history = ref.watch(chatContentsProvider);
    return ListView.builder(
      controller: _scrollController,
      itemBuilder: (context, idx) {
        final content = history[idx];
        final text = content.text;
        return ChatItemWidget(
          text: text,
          isFromUser: content.role == 'user',
        );
      },
      itemCount: history.length,
    );
  }
}
