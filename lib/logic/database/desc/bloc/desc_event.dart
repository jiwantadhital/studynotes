// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'desc_bloc.dart';

abstract class DescEvent extends Equatable {
  const DescEvent();

  @override
  List<Object> get props => [];
}

class DescGettingEvent extends DescEvent {
  int id;
  DescGettingEvent({
    required this.id,
  });
}
