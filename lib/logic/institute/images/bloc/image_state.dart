// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'image_bloc.dart';

abstract class ImageState extends Equatable {
  const ImageState();
  
  @override
  List<Object> get props => [];
}

class ImageInitial extends ImageState {}
class ImageLoading extends ImageState {}
class ImageLoaded extends ImageState {
    List<ImagesModel> imageModel;
  ImageLoaded({
    required this.imageModel,
  });
  @override
  List<Object> get props => [imageModel];
}
class ImageError extends ImageState {
  String error;
  ImageError({
    required this.error,
  });
}
