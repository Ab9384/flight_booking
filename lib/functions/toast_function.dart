// ignore_for_file: avoid_print

import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

class ToastFunction {
  static void showRedToast(String message, BuildContext context) {
    if (context.mounted == false) return;
    // if context is invalid, return

    try {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.redColor,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }

  static void showGreenToast(String message, BuildContext context) {
    if (context.mounted == false) return;
    try {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.greenColor,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.backgroundColor,
            ),
          ),
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }

  // show white toast
  static void showWhiteToast(String message, BuildContext context) {
    if (context.mounted == false) return;
    try {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.backgroundColor,
          ),
          child: Text(
            message,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }
}
