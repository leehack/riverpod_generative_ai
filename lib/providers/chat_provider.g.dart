// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatSessionHash() => r'2ff0ca148483636354529314282dbe80020b7328';

/// See also [chatSession].
@ProviderFor(chatSession)
final chatSessionProvider = Provider<ChatSession>.internal(
  chatSession,
  name: r'chatSessionProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatSessionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatSessionRef = ProviderRef<ChatSession>;
String _$chatContentsHash() => r'4bbabe1f69948461755ef4a42f4a1d22325a190c';

/// See also [chatContents].
@ProviderFor(chatContents)
final chatContentsProvider = AutoDisposeProvider<List<ChatContent>>.internal(
  chatContents,
  name: r'chatContentsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatContentsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ChatContentsRef = AutoDisposeProviderRef<List<ChatContent>>;
String _$chatMessageHash() => r'8c218bd1ef7beb6ca3d0cded3775056e079e21a7';

/// See also [ChatMessage].
@ProviderFor(ChatMessage)
final chatMessageProvider =
    AutoDisposeAsyncNotifierProvider<ChatMessage, String>.internal(
  ChatMessage.new,
  name: r'chatMessageProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$chatMessageHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ChatMessage = AutoDisposeAsyncNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
