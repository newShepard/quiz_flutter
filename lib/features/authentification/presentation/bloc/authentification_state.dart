part of 'authentification_bloc.dart';

abstract class AuthentificationState extends Equatable {
  const AuthentificationState();
}

class AuthentificationInitial extends AuthentificationState {
  @override
  List<Object> get props => [];
}
