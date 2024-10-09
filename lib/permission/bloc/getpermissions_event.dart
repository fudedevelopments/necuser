// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'getpermissions_bloc.dart';

@immutable
sealed class GetpermissionsEvent {}

class DeleteOnDutyRequest extends GetpermissionsEvent {
  final Ondutyrequest ondutyrequest;
  DeleteOnDutyRequest({
    required this.ondutyrequest,
  });
}
