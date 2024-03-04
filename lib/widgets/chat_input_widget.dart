import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_gemini/providers/chat_provider.dart';
import 'package:riverpod_gemini/widgets/text_field_decoration.dart';

class ChatInputBoxWidget extends ConsumerStatefulWidget {
  const ChatInputBoxWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChatInputBoxWidgetState();
}

class _ChatInputBoxWidgetState extends ConsumerState<ChatInputBoxWidget> {
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode(debugLabel: 'TextField');

  @override
  Widget build(BuildContext context) {
    ref.listen(chatMessageProvider, (previous, next) {
      if (next.hasError) {
        _showError(next.error.toString());
      }
    });
    return Row(
      children: [
        Expanded(
          child: TextField(
            autofocus: true,
            focusNode: _textFieldFocus,
            decoration: textFieldDecoration(context, 'Enter a prompt...'),
            controller: _textController,
            onSubmitted: (String value) => _sendMessage(value),
          ),
        ),
        const SizedBox.square(dimension: 15),
        if (!ref.watch(chatMessageProvider).isLoading)
          IconButton(
            onPressed: () => _sendMessage(_textController.text),
            icon: Icon(
              Icons.send,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        else
          const CircularProgressIndicator(),
      ],
    );
  }

  Future<void> _sendMessage(String text) async {
    await ref.read(chatMessageProvider.notifier).send(text);
    _textController.clear();
    _textFieldFocus.requestFocus();
  }

  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }
}
