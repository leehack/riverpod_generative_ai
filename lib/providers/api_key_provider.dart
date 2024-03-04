import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api_key_provider.g.dart';

@Riverpod(keepAlive: true)
class ApiKey extends _$ApiKey {
  @override
  String? build() {
    return null;
  }

  void setApiKey(String value) {
    state = value;
  }
}
