part of 'jokes_bloc.dart';

abstract class JokesState extends Equatable {
  const JokesState();

  @override
  List<Object> get props => [];
}

class GettingJokesInitialStatus extends JokesState {}

class LoadingJokesStatus extends JokesState {}

class ErrorGettingJokesStatus extends JokesState {}

class JokeRetrievedSuccessfullyStatus extends JokesState {
  final List<JokeEntity> jokesList;
  const JokeRetrievedSuccessfullyStatus(this.jokesList);
  @override
  List<Object> get props => [jokesList];

}
