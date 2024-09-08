import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necuser/home/repository/home_repo.dart';
import 'package:necuser/model/event_model.dart';
import 'package:necuser/utils.dart';


part 'homebloc_event.dart';
part 'homebloc_state.dart';

class HomeblocBloc extends Bloc<HomeblocEvent, HomeblocState> {
  HomeblocBloc() : super(HomeblocInitial()) {
    on<HomePageQueryEvent>(homePageQueryEvent);
  }

  FutureOr<void> homePageQueryEvent(
      HomePageQueryEvent event, Emitter<HomeblocState> emit) async {
      emit(HomePageQueryLoadingState());
      List result = await getAllHomefunction();
      handlebloc(
        statuscode: result[0],
        success: () {
          emit(HomePageQuerySuccessState(models: result[1]));
        },
        failure: () {
          emit(HomePageQueryFailureState());
        });
  }
}
