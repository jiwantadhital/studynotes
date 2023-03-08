// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chapter_bloc.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class ChapterGettingEvent extends ChapterEvent {
  int id;
  ChapterGettingEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
