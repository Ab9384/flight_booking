import 'package:flight/utils/app_colors.dart';
import 'package:flutter/material.dart';

class DotWithPlaneIcon extends StatelessWidget {
  const DotWithPlaneIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, 20),
          painter: DottedPainter(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/icons/plane.png',
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}

class DottedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.primaryColor // Set the color of the dotted line
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    double dashWidth = 1;
    double dashSpace = 5;
    double startX = 10; // Start x-coordinate of the line
    double endX = size.width - 10; // End x-coordinate of the line
    double startY = size.height / 2;

    // Draw the start dot
    canvas.drawCircle(Offset(startX, startY), 4, paint);

    while (startX < endX) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX + dashWidth, startY), paint);
      final double space = dashSpace;
      startX += dashWidth + space;
    }

    // Draw the end dot
    canvas.drawCircle(Offset(endX, startY), 4, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

// dot with plane icon white
class DotWithPlaneIconWhite extends StatelessWidget {
  const DotWithPlaneIconWhite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: const Size(double.infinity, 20),
          painter: DottedPainterWhite(),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 0,
          child: Image.asset(
            'assets/icons/plane.png',
            color: AppColors.backgroundColor,
            height: 20,
            width: 20,
          ),
        ),
      ],
    );
  }
}

class DottedPainterWhite extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = AppColors.backgroundColor // Set the color of the dotted line
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    double dashWidth = 1;
    double dashSpace = 5;
    double startX = 10; // Start x-coordinate of the line
    double endX = size.width - 10; // End x-coordinate of the line
    double startY = size.height / 2;

    // Draw the start dot
    canvas.drawCircle(Offset(startX, startY), 4, paint);

    while (startX < endX) {
      canvas.drawLine(
          Offset(startX, startY), Offset(startX + dashWidth, startY), paint);
      final double space = dashSpace;
      startX += dashWidth + space;
    }

    // Draw the end dot
    canvas.drawCircle(Offset(endX, startY), 4, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
