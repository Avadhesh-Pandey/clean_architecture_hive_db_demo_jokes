import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jokes/core/usecases/usecase.dart';
import 'package:jokes/features/domain/entities/joke_entity.dart';
import 'package:jokes/features/domain/usecases/jokes_usecase.dart';

part 'jokes_event.dart';

part 'jokes_state.dart';

class GetJokesBloc extends Bloc<JockEvent, JokesState> {
  final JokesUseCase getJokesUseCase;

  GetJokesBloc({
    required this.getJokesUseCase,
  }) : super(GettingJokesInitialStatus()) {
    on<JockEvent>((event, emit) async {
      if (event is GetJokesEvent) {
        emit(LoadingJokesStatus());
        final failureOrSuccessGettingJokesStatus = await getJokesUseCase(NoParams());
        failureOrSuccessGettingJokesStatus.fold(
          (failure) => emit(ErrorGettingJokesStatus()),
          (jokes) => emit(JokeRetrievedSuccessfullyStatus(jokes)),
        );
      }
    });
  }
}
