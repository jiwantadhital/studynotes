import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/institute_controller.dart';
import 'package:studynotes/models/institute_model.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  InstituteController instituteController;
  ImageBloc({required this.instituteController}) : super(ImageInitial()) {
    on<ImageGettingEvent>((event, emit) async{
      emit(ImageLoading());
      try{
        var data = await instituteController.getImage(event.id);
        emit(ImageLoaded(imageModel: data));
      }
      catch(e){
        emit(ImageError(error: "Something went wrong"));
      }
    });
  }
}
