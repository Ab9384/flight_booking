// ignore_for_file: avoid_print

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../utils/app_colors.dart';

class ToastFunction {
  static void showRedToast(BuildContext context, String message) {
    if (context.mounted == false) return;
    // if context is invalid, return

    try {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.redColor.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Positioned(
              left: 15,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.redColor.withOpacity(0.9),
                child: ExtendedImage.asset(
                  'assets/icons/plane_takeoff.png',
                  color: AppColors.backgroundColor,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
        ),
        gravity: ToastGravity.TOP,
        toastDuration: const Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }

  static void showGreenToast(
    BuildContext context,
    String message,
  ) {
    if (context.mounted == false) return;
    try {
      FToast fToast = FToast();
      fToast.init(context);
      fToast.showToast(
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.greenColor.withOpacity(0.6),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        message,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.backgroundColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
            Positioned(
              left: 15,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: AppColors.greenColor.withOpacity(0.9),
                child: ExtendedImage.asset(
                  'assets/icons/plane_takeoff.png',
                  color: AppColors.backgroundColor,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
          ],
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
