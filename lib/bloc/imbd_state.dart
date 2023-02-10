part of 'imbd_bloc.dart';

@immutable
abstract class ImbdState {}

class ImbdInitial extends ImbdState {}

class ImbdError extends ImbdState {}

class ImbdSucces extends ImbdState {
  final modelCinema model;
  ImbdSucces({required this.model});
}
