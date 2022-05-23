import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/marca/marca_response.dart';
import 'package:footage_flutter/repository/marca/marca_repository.dart';

part 'marca_event.dart';
part 'marca_state.dart';

class MarcaBloc extends Bloc<MarcaEvent, MarcaState> {

  final MarcaRepository public;
  
  MarcaBloc(this.public) : super(MarcaInitial()) {
    on<FetchMarca>(_marcasFetched);
  }

  void _marcasFetched(FetchMarca event, Emitter<MarcaState> emit) async {
    try {
      final marcas = await public.fetchMarca();
      emit(MarcasFetched(marcas));
    } on Exception catch (e) {
      emit(MarcaFetchError(e.toString()));
    }
  }

}
