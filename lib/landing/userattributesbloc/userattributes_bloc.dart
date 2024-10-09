import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:necuser/landing/repo/landing_pagr_repo.dart';
import 'package:necuser/models/ModelProvider.dart';
import 'package:necuser/utils.dart';
part 'userattributes_event.dart';
part 'userattributes_state.dart';

class UserattributesBloc
    extends Bloc<UserattributesEvent, UserattributesState> {
  UserattributesBloc() : super(UserattributesInitial()) {
    on<GetUserAttributesEvent>(getUserAttributesEvent);
  }

  FutureOr<void> getUserAttributesEvent(
      GetUserAttributesEvent event, Emitter<UserattributesState> emit) async {
    emit(GetUserAttributesLoadingState());
    List attributes = await fetchUserAttributes();
    handlebloc(
        statuscode: attributes[0],
        success: () {
          emit(GetUserAttributesSuccessState(student: attributes[1]));
        },
        failure: () {
          emit(GetUserAttributesFailureState());
        });
  }
}
