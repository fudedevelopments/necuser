import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/permission/repository/permission_repository.dart';
import 'package:necuser/utils.dart';

part 'getpermissions_event.dart';
part 'getpermissions_state.dart';

class GetpermissionsBloc
    extends Bloc<GetpermissionsEvent, GetpermissionsState> {
  GetpermissionsBloc() : super(GetpermissionsInitial()) {
    on<DeleteOnDutyRequest>(deleteOnDutyRequest);
  }

  FutureOr<void> deleteOnDutyRequest(
      DeleteOnDutyRequest event, Emitter<GetpermissionsState> emit) async {
    emit(DeleteOnDutyRequestLoadingState());
    List res = await deleteOnDutyRequestFunction(event.ondutyrequest);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(DeleteOnDutyRequestSuccessState());
        },
        failure: () {
          emit(DeleteOnDutyRequestFailureState());
        });
  }
}
