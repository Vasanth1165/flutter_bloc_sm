import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_event.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_state.dart';

class ImagePickerPage extends StatelessWidget {
  const ImagePickerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker"),
      ),
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
          buildWhen: (previous, current) => previous.file != current.file,
          builder: (context, state) {
            return state.file == null
                ? const Icon(Icons.broken_image_sharp)
                : Image.file(
                    File(state.file!),
                    height: 400,
                    width: double.infinity,
                  );
          },
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ImagePickerBloc>().add(PickFromCameraEvent());
            },
            child: const Icon(Icons.camera_alt_outlined),
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ImagePickerBloc>().add(PickFromGallaryEvent());
            },
            child: const Icon(Icons.photo_outlined),
          ),
        ],
      ),
    );
  }
}
