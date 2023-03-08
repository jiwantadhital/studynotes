part of 'allnotes_bloc.dart';

abstract class AllnotesEvent extends Equatable {
  const AllnotesEvent();

  @override
  List<Object> get props => [];
}

class AllnotesGettingEvent extends AllnotesEvent {
  int id;
  AllnotesGettingEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}