import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_event.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_state.dart';
import 'package:flutter_bloc_sm/utills/image_picker_utill.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtill imagePicker;

  ImagePickerBloc(this.imagePicker) : super(const ImagePickerState()) {
    on<PickFromCameraEvent>(_fromCamera);
    on<PickFromGallaryEvent>(_fromGallary);
  }

  void _fromCamera(
      PickFromCameraEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePicker.fromCamera();
    emit(state.copyWith(path: file.path));
  }

  void _fromGallary(
      PickFromGallaryEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePicker.fromGallary();
    emit(state.copyWith(path: file.path));
  }
}
