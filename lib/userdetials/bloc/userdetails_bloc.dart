import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/userdetials/repositry/user_repo.dart';
import 'package:necuser/utils.dart';

part 'userdetails_event.dart';
part 'userdetails_state.dart';

class UserdetailsBloc extends Bloc<UserdetailsEvent, UserdetailsState> {
  UserdetailsBloc() : super(UserdetailsInitial()) {
    on<GetAllUserDataEvent>(getAllUserDataEvent);
  }

  FutureOr<void> getAllUserDataEvent(
      GetAllUserDataEvent event, Emitter<UserdetailsState> emit) async {
    emit(GetUserDataLoadingState());
    List res = await getallUserDataFunction(event.student);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(GetUserDataSuccessState(
            ac: res[1][0],
            hod: res[1][1]
          ));
        },
        failure: () {
          emit(GetUserDataFailureState());
        });
  }
}
