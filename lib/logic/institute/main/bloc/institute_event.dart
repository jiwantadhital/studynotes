part of 'institute_bloc.dart';

abstract class InstituteEvent extends Equatable {
  const InstituteEvent();

  @override
  List<Object> get props => [];
}

class InstituteGettingEvent extends InstituteEvent{}