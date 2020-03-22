class AppSingleton {
  static final AppSingleton _instance = AppSingleton._internal();

  factory AppSingleton() {
    return _instance;
  }

  AppSingleton._internal();
}

class AppLazySingleton {
  static AppLazySingleton _instance;

  factory AppLazySingleton() {
    return _instance ??= AppLazySingleton._internal();
  }

  AppLazySingleton._internal();
}
