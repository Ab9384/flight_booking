import 'package:flight/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool isBusy;

  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.isBusy});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (!isBusy) {
          onPressed();
        }
      },
      style: ElevatedButton.styleFrom(
        fixedSize: const Size(double.infinity, 50),
        foregroundColor: AppColors.backgroundColor,
        backgroundColor: AppColors.primaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: isBusy
          ? const SizedBox(
              width: double.infinity,
              child: CupertinoActivityIndicator(
                color: AppColors.backgroundColor,
              ),
            )
          : SizedBox(
              width: double.infinity,
              child: Center(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: AppColors.backgroundColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
    );
  }
}
