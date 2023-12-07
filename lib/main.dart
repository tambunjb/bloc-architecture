import 'package:bloc_architecture/logic/blocs/country_bloc.dart';
import 'package:bloc_architecture/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CountryBloc(),
      child: MaterialApp(
        title: 'Search Country',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Home(title: 'Search Country Home Page'),
      ),
    );
  }
}
