import 'package:image_picker/image_picker.dart';

class ImagePickerUtill{
  final _picker = ImagePicker();

  Future<XFile> fromCamera() async{
    XFile? file =await _picker.pickImage(source:ImageSource.camera);
    return file!;
  } 

  Future<XFile> fromGallary() async{
    XFile? file =await _picker.pickImage(source:ImageSource.gallery);
    return file!;
  } 
}