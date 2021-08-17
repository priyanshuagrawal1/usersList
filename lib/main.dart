import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newproject/features/users_list/presentation/bloc/getdata_bloc.dart';
import 'package:newproject/core/di/injector.dart';
import 'package:newproject/features/users_list/presentation/pages/homepage.dart';
import 'package:newproject/features/users_list/presentation/pages/users_details_screen.dart';

void main() {
  Injector.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetdataBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
        routes: {
          UsersDetailsScreen.routeName: (ctx) => const UsersDetailsScreen()
        },
      ),
    );
  }
}
