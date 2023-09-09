import 'package:dartz/dartz.dart';
import 'package:jokes/core/error/failure.dart';
import 'package:jokes/features/data/datasource/local/jokes_local_data_source.dart';
import 'package:jokes/features/data/datasource/remote/jokes_remote_data_source.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:jokes/features/domain/repositories/jokes_repository.dart';

class JokesRepositoryImpl implements JokesRepository {
  final JokesRemoteDataSource remoteDataSource;
  final JokesLocalDataSource localDataSource;

  JokesRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, List<JokeEntity>>> getJokes() async {
    try {
      var response = await remoteDataSource.getTheJoke();
      await localDataSource.saveTheJoke(response);
      var cachedJokes = await localDataSource.getCachedJokes();
      return right(cachedJokes);
    } catch (e) {
      throw APIFailure("API failure");
    }
  }
}
