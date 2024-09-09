import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'permisson_event.dart';
part 'permisson_state.dart';

class PermissonBloc extends Bloc<PermissonEvent, PermissonState> {
  PermissonBloc() : super(PermissonInitial()) {
    on<PermissonEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
