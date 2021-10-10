import 'package:get_it/get_it.dart';

import 'data/data_sources/data_source.dart';
import 'data/data_sources/remote_data_source.dart';
import 'data/repositories/app_repository.dart';
import 'data/services/apis/api.dart';
import 'data/services/navigation/navigation_service.dart';
import 'data/services/navigation/navigation_service_impl.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Api>(() => Api());

  locator.registerLazySingleton<DataSourceProviderI>(
      () => RemoteDataSourceProvider(locator<Api>()));
  locator.registerLazySingleton<AppRepository>(
      () => AppRepository(locator<DataSourceProviderI>()));

  locator
      .registerLazySingleton<NavigationService>(() => NavigationServiceImpl());
}
