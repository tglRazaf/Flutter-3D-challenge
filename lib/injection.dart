import 'package:get_it/get_it.dart';

import 'core/providers/character_movin_provider.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  registerProviders();
}

void registerProviders() {
  getIt.registerLazySingleton(
    () => CharacterMovinProvider(),
  );
}
