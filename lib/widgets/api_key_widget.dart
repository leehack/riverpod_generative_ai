import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_gemini/providers/api_key_provider.dart';
import 'package:riverpod_gemini/widgets/text_field_decoration.dart';
import 'package:url_launcher/link.dart';

class ApiKeyWidget extends StatelessWidget {
  const ApiKeyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'To use the Gemini API, you\'ll need an API key. '
              'If you don\'t already have one, '
              'create a key in Google AI Studio.',
            ),
            const SizedBox(height: 8),
            Link(
              uri: Uri.https('makersuite.google.com', '/app/apikey'),
              target: LinkTarget.blank,
              builder: (context, followLink) => TextButton(
                onPressed: followLink,
                child: const Text('Get an API Key'),
              ),
            ),
            const SizedBox(height: 8),
            const ApiKeyTextField(),
          ],
        ),
      ),
    );
  }
}

class ApiKeyTextField extends ConsumerStatefulWidget {
  const ApiKeyTextField({super.key});

  @override
  ConsumerState<ApiKeyTextField> createState() => _ApiKeyTextFieldState();
}

class _ApiKeyTextFieldState extends ConsumerState<ApiKeyTextField> {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: textFieldDecoration(context, 'Enter your API key'),
            controller: _textController,
            onSubmitted: (value) {
              ref.read(apiKeyProvider.notifier).setApiKey(value);
            },
          ),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () {
            ref
                .read(apiKeyProvider.notifier)
                .setApiKey(_textController.value.text);
          },
          child: const Text('Submit'),
        ),
      ],
    );
  }
}
