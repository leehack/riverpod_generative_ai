import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_gemini/providers/api_key_provider.dart';
import 'package:riverpod_gemini/widgets/api_key_widget.dart';
import 'package:riverpod_gemini/widgets/chat_input_widget.dart';
import 'package:riverpod_gemini/widgets/chat_list_widget.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: switch (ref.watch(apiKeyProvider)) {
        _? => const ChatWidget(),
        _ => const ApiKeyWidget(),
      },
    );
  }
}

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: ChatListWidget()),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            child: ChatInputBoxWidget(),
          ),
        ],
      ),
    );
  }
}
