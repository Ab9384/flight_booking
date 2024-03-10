import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class ToastFunction {
  static void showRedToast(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 30),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.redColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Error',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'roboto-bold',
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble image
            Positioned(
              top: 0,
              left: 20,
              child: Stack(
                children: [
                  ExtendedImage.asset(
                    'assets/icons/chat_bubble.png',
                    height: 50,
                    width: 50,
                    color: AppColors.darkRed,
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      CupertinoIcons.clear_thick,
                      color: AppColors.backgroundColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // warning toast message
  static void showOrangeToast(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 30),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.orangeColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Warning',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'roboto-bold',
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble image
            Positioned(
              top: 0,
              left: 20,
              child: Stack(
                children: [
                  ExtendedImage.asset(
                    'assets/icons/chat_bubble.png',
                    height: 50,
                    width: 50,
                    color: AppColors.darkOrange,
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      CupertinoIcons.exclamationmark,
                      color: AppColors.backgroundColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  // show success toast message with green color
  static void showGreenToast(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        content: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 0, top: 30),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.greenColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Success',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'roboto-bold',
                      fontWeight: FontWeight.bold,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.backgroundColor,
                    ),
                  ),
                ],
              ),
            ),
            // chat bubble image
            Positioned(
              top: 0,
              left: 20,
              child: Stack(
                children: [
                  ExtendedImage.asset(
                    'assets/icons/chat_bubble.png',
                    height: 50,
                    width: 50,
                    color: AppColors.darkGreen,
                  ),
                  const Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    right: 0,
                    child: Icon(
                      CupertinoIcons.checkmark,
                      color: AppColors.backgroundColor,
                      size: 20,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
