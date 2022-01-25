import 'package:get_it/get_it.dart';

import '../../features/home/view_models/home_view_model.dart';

class AppDependencies {
  AppDependencies._();

  static final i = AppDependencies._();
  static final locate = GetIt.instance;

  void register() {
    _homeDependencies();
  }

  void _homeDependencies() {
    locate.registerLazySingleton(() => HomeViewModel());
  }
}
