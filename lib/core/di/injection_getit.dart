import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:jokes/features/data/datasource/local/jokes_local_data_source.dart';
import 'package:jokes/features/data/datasource/remote/jokes_remote_data_source.dart';
import 'package:jokes/features/data/datasource/remote/network/api_services.dart';
import 'package:jokes/features/data/repositories/jokes_repository_impl.dart';
import 'package:jokes/features/domain/repositories/jokes_repository.dart';
import 'package:jokes/features/domain/usecases/jokes_usecase.dart';
import 'package:jokes/features/presentation/bloc/auth_status/jokes_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  sl.registerLazySingleton(() => ApiServices());
  sl.registerLazySingleton<HiveInterface>(() => Hive);

  //bloc
  sl.registerFactory(
    () => GetJokesBloc(getJokesUseCase: sl(),
    ),
  );

  //use cases
  sl.registerLazySingleton(() => JokesUseCase(sl()));

  //data sources
  sl.registerLazySingleton<JokesRemoteDataSource>(
        () => JokesRemoteDataSourceImpl(apiServices: sl()),
  );
  sl.registerLazySingleton<JokesLocalDataSource>(
        () => JokesLocalDataSourceImpl(hive: sl()),
  );

  //repos
  sl.registerLazySingleton<JokesRepository>(
    () => JokesRepositoryImpl(remoteDataSource: sl(),localDataSource: sl()),
  );
}
