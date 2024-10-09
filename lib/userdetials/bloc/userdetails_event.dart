// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'userdetails_bloc.dart';

@immutable
sealed class UserdetailsEvent {}

class GetAllUserDataEvent extends UserdetailsEvent {
  final Student student;
  GetAllUserDataEvent({
    required this.student,
  });
}
