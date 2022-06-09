part of 'buscar_bloc.dart';

abstract class BuscarEvent extends Equatable {
  const BuscarEvent();

  @override
  List<Object> get props => [];
}

class FetchBuscar extends BuscarEvent {

  const FetchBuscar();

  @override
  List<Object> get props => [];

}