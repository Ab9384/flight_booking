import 'package:firebase_auth/firebase_auth.dart';
import 'package:flight/firebase/auth_function.dart';
import 'package:flight/functions/navigator_function.dart';
import 'package:flight/model/user_model.dart';
import 'package:flight/provider/app_data.dart';
import 'package:flight/screens/authentication/signup_screen.dart';
import 'package:flight/screens/home_tab.dart';
import 'package:flight/screens/landing_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DecidingScreen extends StatefulWidget {
  const DecidingScreen({super.key});

  @override
  State<DecidingScreen> createState() => _DecidingScreenState();
}

class _DecidingScreenState extends State<DecidingScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      decideScreen(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: CupertinoActivityIndicator(
        radius: 15,
        animating: true,
        key: Key('deciding_screen_activity_indicator'),
      )),
    );
  }

  decideScreen(context) async {
    User? user = AuthFunction().getCurrentUser();
    bool isLoggedIn = user != null;
    if (isLoggedIn) {
      UserModel userModel = UserModel(
          name: 'Abhishek Bhardwaj', email: 'abhishekbharadwaj9384@gmail.com');
      // await DatabaseFunctions.getUserData(user.uid, context);
      Provider.of<AppData>(context, listen: false).setUserModel = userModel;
      if (userModel.name == null) {
        // username screen
        NavigatorFunctions.navigateAndClearStack(context, const SignUpScreen());
      } else {
        // home screen
        NavigatorFunctions.navigateAndClearStack(context, const HomeTab());
      }
    } else {
      NavigatorFunctions.navigateAndClearStack(context, const LandingScreen());
    }
  }
}
