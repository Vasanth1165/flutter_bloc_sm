import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/container_bloc/container_bloc.dart';
import 'package:flutter_bloc_sm/blocs/counter_bloc/counter_bloc.dart';
import 'package:flutter_bloc_sm/blocs/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter_bloc_sm/main_page.dart';
import 'package:flutter_bloc_sm/utills/image_picker_utill.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, 
      statusBarIconBrightness: Brightness.dark));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => ContainerBloc()),
        BlocProvider(create: (_)=> ImagePickerBloc(ImagePickerUtill()))
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                centerTitle: true,
              )),
          home: const MainPage()),
    );
  }
}
