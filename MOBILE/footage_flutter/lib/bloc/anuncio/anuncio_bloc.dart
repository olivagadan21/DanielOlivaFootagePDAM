import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/anuncio/anuncio_response.dart';
import 'package:footage_flutter/repository/anuncio/anuncio_repository.dart';

part 'anuncio_event.dart';
part 'anuncio_state.dart';

class AnuncioBloc extends Bloc<AnuncioEvent, AnuncioState> {
  
  final AnuncioRepository public;
  
  AnuncioBloc(this.public) : super(AnuncioInitial()) {
    on<FetchAnuncio>(_anunciosFetched);
  }

  void _anunciosFetched(FetchAnuncio event, Emitter<AnuncioState> emit) async {
    try {
      final anuncio = await public.fetchAnuncioAleatory();
      emit(AnunciosFetched(anuncio));
    } on Exception catch (e) {
      emit(AnuncioFetchError(e.toString()));
    }
  }
}
