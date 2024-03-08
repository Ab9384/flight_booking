import 'package:extended_image/extended_image.dart';
import 'package:flight/functions/navigator_function.dart';
import 'package:flight/screens/authentication/login_screen.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryColor,
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Center(
                    child: ExtendedImage.asset(
                  'assets/images/plane_image.png',
                  width: double.infinity,
                ))),
            Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15.0),
                  color: AppColors.backgroundColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Explore Exciting Destinations',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 26,
                          fontFamily: 'roboto-bold',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Book your flight and explore the world with us. We offer the best prices for your flight bookings.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 16,
                        ),
                      ),
                      PrimaryButton(
                          text: 'Get Started',
                          onPressed: () {
                            NavigatorFunctions.navigateTo(
                                context, const LoginScreen());
                          },
                          isBusy: false)
                    ],
                  ),
                )),
          ],
        ));
  }
}
