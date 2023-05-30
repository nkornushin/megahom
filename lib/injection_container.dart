import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:megaohm/data/providers/megaohm_provider.dart';

import 'data/providers/megaohm_provider_impl.dart';
import 'data/repositories/megaohm_repository_impl.dart';
import 'domain/repositories/megaohm_repository.dart';
import 'domain/usecases/get_telemetry_usecase.dart';
import 'network/dio_factory.dart';
import 'presentation/bloc/telemetry/telemetry_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt.registerLazySingleton<Dio>(
    () => apiDioFactory(),
  );

  getIt.registerLazySingleton<MegaohmProvider>(
    () => MegaohmProviderImpl(getIt.call()),
  );

  getIt.registerLazySingleton<MegaohmRepository>(
    () => MegaohmRepositoryImpl(getIt.call()),
  );

  getIt.registerLazySingleton<GetTelemetryUseCase>(
    () => GetTelemetryUseCase(repository: getIt.call()),
  );

  getIt.registerFactory<TelemetryCubit>(
    () => TelemetryCubit(getTelemetryUseCase: getIt.call()),
  );

  //Futures bloc
  // sl.registerFactory<AuthCubit>(() => AuthCubit(
  //       signOutUseCase: sl.call(),
  //       isSignInUseCase: sl.call(),
  //       getCurrentUidUseCase: sl.call(),
  //     ));
}
