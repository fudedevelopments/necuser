// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'userdetails_bloc.dart';

@immutable
sealed class UserdetailsState {}

final class UserdetailsInitial extends UserdetailsState {}

class GetUserDataSuccessState extends UserdetailsState {
   final Ac? ac;
   final Hod? hod;
  GetUserDataSuccessState({
    required this.ac,
    required this.hod,
  });
}

class GetUserDataLoadingState extends UserdetailsState {}

class GetUserDataFailureState extends UserdetailsState {}
