part of 'anuncio_bloc.dart';

abstract class AnuncioState extends Equatable {
  const AnuncioState();
  
  @override
  List<Object> get props => [];
}

class AnuncioInitial extends AnuncioState {}

class AnunciosFetched extends AnuncioState {
  final AnuncioResponse anuncio;

  const AnunciosFetched(this.anuncio);

  @override
  List<Object> get props => [anuncio];
}

class AnuncioFetchError extends AnuncioState {
  final String message;
  const AnuncioFetchError(this.message);

  @override
  List<Object> get props => [message];
}