import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:garden_central/bloc/theme/bloc/theme_bloc.dart';
import 'package:garden_central/components/app_theme.dart';
import 'package:garden_central/screens/home_page.dart';
import 'package:garden_central/screens/login/auth.dart';
import 'package:garden_central/screens/login/login_screen.dart';
import 'package:garden_central/screens/plants/new_arrival.dart';
import 'package:garden_central/screens/style.dart';
import 'package:garden_central/theme/theme_constants.dart';
import 'package:garden_central/theme/theme_manager.dart';
import 'package:get/get.dart';
import 'bloc/auth/bloc/auth_bloc.dart';
import 'bloc/user/user_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      //options: DefaultFirebaseOptions.currentPlatform,
      );
  runApp(const MyApp());
}

ThemeManager _themeManager = ThemeManager();

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
        //BlocProvider(create: (context) => AuthBloc()),
      ],
      //create: (context) => AuthBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return GetMaterialApp(
            title: 'Garden Central',
            debugShowCheckedModeBanner: false,
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
            initialRoute: '/',
            routes: {
              '/': (context) => LogInScreen(),
              '/home': (context) => HomePage(),
              '/new_arrival': (context) => NewArrivalPage(),
              '/style_home': (context) => StyleHomePage(),
              '/new_arrival': (context) => NewArrivalPage(),
            },
            //home: LogInScreen(),
          );
        },
      ),
    );
  }
}
