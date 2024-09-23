// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'permisson_bloc.dart';

@immutable
sealed class PermissonState {}

final class PermissonInitial extends PermissonState {}

class GetStudentUsingAttributesSuccessState extends PermissonState {
  final Student student;
  final List<Ondutyrequest> ondutylist;
  GetStudentUsingAttributesSuccessState({
    required this.student,
    required this.ondutylist,
  });
}

class GetStudentUsingAttributesFailureState extends PermissonState {}

class GetStudentUsingAttributesLoadingState extends PermissonState {}

class AddondutyRequestSuccessState extends PermissonState {}

class AddondutyRequestLoadingState extends PermissonState {}

class AddondutyRequestFailureState extends PermissonState {}
