// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'userattributes_bloc.dart';

@immutable
sealed class UserattributesState {}

final class UserattributesInitial extends UserattributesState {}

class GetUserAttributesSuccessState extends UserattributesState {
  final Student student;
  GetUserAttributesSuccessState({
    required this.student,
  });
}

class GetUserAttributesLoadingState extends UserattributesState {}

class GetUserAttributesFailureState extends UserattributesState {}
