part of 'anuncio_bloc.dart';

abstract class AnuncioEvent extends Equatable {
  const AnuncioEvent();

  @override
  List<Object> get props => [];
}

class FetchAnuncio extends AnuncioEvent {

  const FetchAnuncio();

  @override
  List<Object> get props => [];
}