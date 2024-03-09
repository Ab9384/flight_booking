import 'package:firebase_core/firebase_core.dart';
import 'package:flight/deciding_screen.dart';
import 'package:flight/firebase_options.dart';
import 'package:flight/provider/app_data.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.primaryColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => AppData())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flight Booking App',
        theme: ThemeData(
          fontFamily: GoogleFonts.roboto().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          useMaterial3: true,
        ),
        home: const DecidingScreen(),
      ),
    );
  }
}
