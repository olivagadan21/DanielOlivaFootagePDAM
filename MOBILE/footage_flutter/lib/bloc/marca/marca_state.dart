part of 'marca_bloc.dart';

abstract class MarcaState extends Equatable {
  const MarcaState();
  
  @override
  List<Object> get props => [];
}

class MarcaInitial extends MarcaState {}

class MarcasFetched extends MarcaState {
  final List<MarcaResponse> marcas;

  const MarcasFetched(this.marcas);

  @override
  List<Object> get props => [marcas];
}

class MarcaFetchError extends MarcaState {
  final String message;
  const MarcaFetchError(this.message);

  @override
  List<Object> get props => [message];
}