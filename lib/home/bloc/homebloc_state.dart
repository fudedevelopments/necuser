// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'homebloc_bloc.dart';

@immutable
sealed class HomeblocState {}

final class HomeblocInitial extends HomeblocState {}

class HomePageQuerySuccessState extends HomeblocState {
  final List<Eventmodel> models;
  HomePageQuerySuccessState({
    required this.models,
  });
}

class HomepagequeryLoadingstate extends HomeblocState{}


class HomePageQueryFailureState extends HomeblocState{}

class HomePageQueryLoadingState extends HomeblocState{}
