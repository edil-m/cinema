part of 'imbd_bloc.dart';

@immutable
abstract class ImbdEvent {}

class SendSearchRequest extends ImbdEvent {
  final String cinemaName;
  SendSearchRequest({required this.cinemaName});
}
