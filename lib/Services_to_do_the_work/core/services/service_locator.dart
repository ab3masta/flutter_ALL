import 'storage_service_shared_pref.dart';
import 'package:get_it/get_it.dart';
import 'storage_service.dart';

GetIt locator = GetIt.instance;

setupServiceLocator() {
  locator.registerLazySingleton<StorageService>(() => StorageServiceSharedPreferences());
}