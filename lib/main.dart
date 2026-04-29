import 'package:assignment2/features/Home/cubit/cubit.logic.dart';
import 'package:assignment2/features/Home/home_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('notesBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  BlocProvider(create: (context) => HomeCubit(),child: HomeScreen(),),
        debugShowCheckedModeBanner: false,
      
    );
  }
}