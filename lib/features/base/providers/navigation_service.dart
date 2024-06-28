import 'package:apparatus_wallet/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigation_service.g.dart';

@riverpod
class NavigationService extends _$NavigationService {
  @override
  build() {
    /// #TODO Class should provide something to watch
    return "Foo";
  }

  get route => super.ref.read(routerProvider).routeInformationProvider.value.uri;

}