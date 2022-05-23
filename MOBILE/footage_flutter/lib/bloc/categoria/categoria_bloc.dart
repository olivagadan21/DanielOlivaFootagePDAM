import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/categoria/categoria_response.dart';
import 'package:footage_flutter/repository/categoria/categoria_repository.dart';

part 'categoria_event.dart';
part 'categoria_state.dart';

class CategoriaBloc extends Bloc<CategoriaEvent, CategoriaState> {
  
  final CategoriaRepository public;
  
  CategoriaBloc(this.public) : super(CategoriaInitial()) {
    on<FetchCategoria>(_categoriasFetched);
  }

  void _categoriasFetched(FetchCategoria event, Emitter<CategoriaState> emit) async {
    try {
      final categoria = await public.fetchCategorias();
      emit(CategoriasFetched(categoria));
    } on Exception catch (e) {
      emit(CategoriaFetchError(e.toString()));
    }
  }

}
