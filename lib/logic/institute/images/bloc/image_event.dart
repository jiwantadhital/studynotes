// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  const ImageEvent();

  @override
  List<Object> get props => [];
}

class ImageGettingEvent extends ImageEvent {
  int id;
  ImageGettingEvent({
    required this.id,
  });
   @override
  List<Object> get props => [id];
}
