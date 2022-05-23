part of 'marca_bloc.dart';

abstract class MarcaEvent extends Equatable {
  const MarcaEvent();

  @override
  List<Object> get props => [];
}

class FetchMarca extends MarcaEvent {

  const FetchMarca();

  @override
  List<Object> get props => [];
}