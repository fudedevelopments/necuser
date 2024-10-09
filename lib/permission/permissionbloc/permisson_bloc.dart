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
        documents: event.documents,
        proctor: event.proctor,
        classRoom: event.classRoom
        
        );
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
    emit(GetStudentUsingAttributesLoadingState());
    List res = await getStudentOndutyFunction(event.student);
    handlebloc(
        statuscode: res[0],
        success: () {
          emit(GetStudentUsingAttributesSuccessState(
            ondutylist: res[1]
            ));
        },
        failure: () {
          emit(GetStudentUsingAttributesFailureState());
        });
  }
}
