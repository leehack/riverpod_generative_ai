// ignore_for_file: scoped_providers_should_specify_dependencies
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_gemini/providers/chat_provider.dart';
import 'package:riverpod_gemini/widgets/chat_item_widget.dart';
import 'package:riverpod_gemini/widgets/chat_list_widget.dart';

void main() {
  testWidgets('ChatListWidget renders 3 item', (tester) async {
    final widget = ProviderScope(
      overrides: [
        chatContentsProvider.overrideWith(
          (ref) => [
            ChatContent('role', 'text'),
            ChatContent('role', 'text'),
            ChatContent('role', 'text'),
          ],
        ),
      ],
      child: const MaterialApp(home: ChatListWidget()),
    );

    await tester.pumpWidget(widget);

    final element = tester.element(find.byType(ChatListWidget));
    final container = ProviderScope.containerOf(element);

    expect(container.read(chatContentsProvider), hasLength(3));
    expect(find.byType(ChatItemWidget), findsExactly(3));
  });
}
