import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/categoria/categoria_response.dart';
import 'package:footage_flutter/models/marca/marca_response.dart';
import 'package:footage_flutter/models/seccion/seccion_response.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository.dart';
import 'package:footage_flutter/repository/marca/marca_repository.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository.dart';

part 'buscar_event.dart';
part 'buscar_state.dart';

class BuscarBloc extends Bloc<BuscarEvent, BuscarState> {
  
  final CategoriaRepository categoriaRepository;
  final SeccionRepository seccionRepository;
  final MarcaRepository marcaRepository;
  
  BuscarBloc(this.categoriaRepository, this.seccionRepository, this.marcaRepository) : super(BuscarInitial()) {
    on<FetchBuscar>(_buscarFetched);
  }

  void _buscarFetched(FetchBuscar event, Emitter<BuscarState> emit) async {
    try {
      final categorias = await categoriaRepository.fetchCategorias();
      final secciones = await seccionRepository.fetchSecciones();
      final marcas = await marcaRepository.fetchMarca();
      emit(BuscarFetched(categorias, secciones, marcas));
    } on Exception catch (e) {
      emit(BuscarFetchError(e.toString()));
    }
  }

}
