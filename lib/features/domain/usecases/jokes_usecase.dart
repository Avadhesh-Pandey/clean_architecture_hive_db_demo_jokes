import 'package:dartz/dartz.dart';
import 'package:jokes/core/error/failure.dart';
import 'package:jokes/core/usecases/usecase.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:jokes/features/domain/repositories/jokes_repository.dart';

class JokesUseCase implements UseCase<List<JokeEntity>, NoParams> {
  final JokesRepository jokesRepository;

  JokesUseCase(this.jokesRepository);

  @override
  Future<Either<Failure, List<JokeEntity>>> call(NoParams params) async {
    return jokesRepository.getJokes();
  }
}
