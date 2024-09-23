// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'permisson_bloc.dart';

@immutable
sealed class PermissonEvent {}

class AddondutyRequestEvent extends PermissonEvent {
  final Student student;
  final String requestName;
  final String description;
  final String date;
  final String location;
  final String registerurl;
  final List<File> documents;

  AddondutyRequestEvent({
    required this.student,
    required this.requestName,
    required this.description,
    required this.date,
    required this.location,
    required this.registerurl,
    required this.documents,
  });
}

class GetStudentUsingAttributes extends PermissonEvent {
  final String email;
  GetStudentUsingAttributes({
    required this.email,
  });
}
