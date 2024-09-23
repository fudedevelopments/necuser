import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/permission/repository/permission_repository.dart';
import 'package:necuser/utils.dart';

part 'permisson_event.dart';
part 'permisson_state.dart';

class PermissonBloc extends Bloc<PermissonEvent, PermissonState> {
  PermissonBloc() : super(PermissonInitial()) {
    on<AddondutyRequestEvent>(addondutyRequestEvent);
    on<GetStudentUsingAttributes>(getStudentUsingAttributes);
  }

  FutureOr<void> addondutyRequestEvent(
      AddondutyRequestEvent event, Emitter<PermissonState> emit) async {
    emit(AddondutyRequestLoadingState());
    List res = await addondutyRequestFunction(
        student: event.student,
        requestname: event.requestName,
        description: event.description,
        date: event.date,
        location: event.location,
        registerurl: event.registerurl,
        documents: event.documents);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(AddondutyRequestSuccessState());
        },
        failure: () {
          emit(AddondutyRequestFailureState());
        });
  }

  FutureOr<void> getStudentUsingAttributes(
      GetStudentUsingAttributes event, Emitter<PermissonState> emit) async {
    GetStudentUsingAttributesLoadingState();
    List res = await getStudentUsingAttributeFunction(event.email);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(GetStudentUsingAttributesSuccessState(
            student: res[1][0],
            ondutylist: res[1][1]
            ));
        },
        failure: () {
          emit(GetStudentUsingAttributesFailureState());
        });
  }
}
