part of 'register_user_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccessState extends RegisterState {
  final RegisterResponse registerResponse;

  const RegisterSuccessState(this.registerResponse);

  @override
  List<Object> get props => [registerResponse];
}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState(this.message);

  @override
  List<Object> get props => [message];
}