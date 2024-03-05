import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_gemini/providers/api_key_provider.dart';
import 'package:riverpod_gemini/screens/chat_screen.dart';
import 'package:riverpod_gemini/widgets/api_key_widget.dart';

void main() {
  testWidgets('chat screen renders ChatWidget when apiKeyProvider is available',
      (tester) async {
    const widget = ProviderScope(
      child: MaterialApp(home: ChatScreen(title: 'Test Title')),
    );
    await tester.pumpWidget(widget);

    final element = tester.element(find.byType(MaterialApp));
    final container = ProviderScope.containerOf(element);

    expect(container.read(apiKeyProvider), null);
    expect(find.byType(ApiKeyWidget), findsOneWidget);
    expect(find.byType(ChatWidget), findsNothing);

    container.read(apiKeyProvider.notifier).setApiKey('test-api-key');
    await tester.pump(const Duration(seconds: 1));

    expect(find.byType(ChatWidget), findsOneWidget);
    expect(find.byType(ApiKeyWidget), findsNothing);
  });
}
