import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sports_venues/Application/Venue/bloc/venue_bloc.dart';
import 'package:sports_venues/Core/colors.dart';
import 'package:sports_venues/Domain/di/injectable.dart';
import 'package:sports_venues/Presentation/Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  configureInjection(Environment.dev);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => getIt<VenueBloc>())],
      child: MaterialApp(
        title: 'Sports Venues',
        debugShowCheckedModeBanner: false,

        /// Setup Basic Theme
        theme: ThemeData(
          colorScheme: .fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: white,
          appBarTheme: AppBarTheme(
            backgroundColor: white,
            shadowColor: white,
            surfaceTintColor: white,
          ),
        ),
        home: Home(),
      ),
    );
  }
}
