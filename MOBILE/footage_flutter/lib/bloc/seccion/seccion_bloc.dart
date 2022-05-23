import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:footage_flutter/models/seccion/seccion_response.dart';
import 'package:footage_flutter/repository/seccion/seccion_repository.dart';

part 'seccion_event.dart';
part 'seccion_state.dart';

class SeccionBloc extends Bloc<SeccionEvent, SeccionState> {
  
  final SeccionRepository public;
  
  SeccionBloc(this.public) : super(SeccionInitial()) {
    on<FetchSeccion>(_seccionesFetched);
  }

  void _seccionesFetched(FetchSeccion event, Emitter<SeccionState> emit) async {
    try {
      final posts = await public.fetchSecciones();
      emit(SeccionesFetched(posts));
    } on Exception catch (e) {
      emit(SeccionFetchError(e.toString()));
    }
  }

}
