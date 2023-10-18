import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application/api/india_api_helper.dart';
import 'package:news_application/api/us_api_helper.dart';
import 'package:news_application/bloc/news_bloc.dart';
import 'package:news_application/bloc2/recommended_bloc.dart';
import 'package:news_application/screens/bottom%20bar/bottom_bar.dart';
import 'package:news_application/screens/splash/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => NewsBloc(usapiHelper: UsApiHelper()),
      ),
      BlocProvider(
        create: (context) => RecoBloc(indiaapiHelper: IndiaApiHelper()),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}
