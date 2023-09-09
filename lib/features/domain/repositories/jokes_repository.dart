import 'package:dartz/dartz.dart';
import 'package:jokes/core/error/failure.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';

abstract class JokesRepository {
  Future<Either<Failure, List<JokeEntity>>> getJokes();
}
