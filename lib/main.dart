//import dari third party
import 'package:duit.in/ui/landinglogin/landing_page.dart';
import 'package:duit.in/ui/landinglogin/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:duit.in/cubit/log_cubit.dart';
import 'package:duit.in/cubit/log_reader_cubit.dart';

//import cubit
import 'package:duit.in/cubit/testcubit.dart';
import 'package:duit.in/cubit/auth_cubit.dart';

//import ui
import 'package:duit.in/ui/splash_page.dart';
import 'package:duit.in/ui/navigation/navigation_page.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const mainApp());
}

class mainApp extends StatelessWidget {
  const mainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider (
      providers: [
        BlocProvider(create: (context) => TestCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => LogCubit()),
        BlocProvider(create: (context) => LogReaderCubit()),
      ],
      child: MaterialApp(
        home: SplashPage(),
        debugShowCheckedModeBanner: false,
        routes: {
          '/nav-page': (context) => NavPage(),
          '/landing-page': (context) => LandingPage(),
          '/login-page': (context) => LoginPage(viewState: 0,),
        },
      )
    );
  }
}
