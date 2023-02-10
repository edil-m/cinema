import 'package:bloc/bloc.dart';
import 'package:cinema/imbd_repo.dart';
import 'package:cinema/model.dart';
import 'package:meta/meta.dart';

part 'imbd_event.dart';
part 'imbd_state.dart';

class ImbdBloc extends Bloc<ImbdEvent, ImbdState> {
  ImbdBloc({required this.repo}) : super(ImbdInitial()) {
    on<SendSearchRequest>(
      (event, emit) async {
        try {
          final result = await repo.searchCinema(name: event.cinemaName);

          emit(
            ImbdSucces(model: result),
          );
        } catch (e) {
          emit(ImbdError());
        }
      },
    );
  }
  final ImbdRepo repo;
}
