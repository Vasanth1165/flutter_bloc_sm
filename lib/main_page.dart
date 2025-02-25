import 'package:flutter/material.dart';
import 'package:flutter_bloc_sm/screens/comments_page.dart';
import 'package:flutter_bloc_sm/screens/container_page.dart';
import 'package:flutter_bloc_sm/screens/counter_page.dart';
import 'package:flutter_bloc_sm/screens/image_picker_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BLOC"),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CounterPage()));
                },
                child: const Text("Counter")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContainerPage()));
                },
                child: const Text("Container")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ImagePickerPage()));
                },
                child: const Text("Image Picker")),
          ),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CommentsPage()));
                },
                child: const Text("Comments API")),
          )
        ],
      ),
    );
  }
}
