part of 'getpermissions_bloc.dart';

@immutable
sealed class GetpermissionsState {}

final class GetpermissionsInitial extends GetpermissionsState {}

class DeleteOnDutyRequestSuccessState extends GetpermissionsState{}

class DeleteOnDutyRequestLoadingState extends GetpermissionsState {}

class DeleteOnDutyRequestFailureState extends GetpermissionsState {}
