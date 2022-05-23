part of 'seccion_bloc.dart';

abstract class SeccionEvent extends Equatable {
  const SeccionEvent();

  @override
  List<Object> get props => [];
}

class FetchSeccion extends SeccionEvent {

  const FetchSeccion();

  @override
  List<Object> get props => [];
}