import 'package:get_it/get_it.dart';

import '../../features/home/presentation/view_models/home_map_view_model.dart';
import '../../features/home/presentation/view_models/home_view_model.dart';

class AppDependencies {
  AppDependencies._();

  static final i = AppDependencies._();
  static final locate = GetIt.instance;

  void register() {
    _homeDependencies();
  }

  void _homeDependencies() {
    locate.registerLazySingleton(() => HomeViewModel(
          mapViewModel: locate(),
        ));
    locate.registerLazySingleton(() => HomeMapViewModel());
  }
}
