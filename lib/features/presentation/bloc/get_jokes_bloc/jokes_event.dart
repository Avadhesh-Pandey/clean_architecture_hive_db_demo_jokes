part of 'jokes_bloc.dart';

abstract class JockEvent extends Equatable {
  const JockEvent();

  @override
  List<Object> get props => [];
}

class GetJokesEvent extends JockEvent {}
