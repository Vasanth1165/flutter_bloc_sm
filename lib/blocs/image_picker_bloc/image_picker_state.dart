import 'package:equatable/equatable.dart';

class ImagePickerState extends Equatable {
  final String? file;
  const ImagePickerState({this.file=""});

  ImagePickerState copyWith({String? path}){
    return ImagePickerState(
      file: path ?? file
    );
  }

  @override
  List<Object> get props => [file as Object];
}
