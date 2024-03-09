import 'package:flight/utils/app_colors.dart';
import 'package:flight/utils/global_variable.dart';
import 'package:flight/widgets/dot_with_plane_icon.dart';
import 'package:flutter/material.dart';

class TicketPreviewWidget extends StatelessWidget {
  const TicketPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: TicketClipper(),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.all(15.0),
          decoration: BoxDecoration(
            color: AppColors.accentColor,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Air India',
                      style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600)),
                  const Spacer(),
                  Text('₹${numberFormat.format(50000)}',
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600))
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              // dotted line
              Container(
                height: 0,
                width: double.infinity,
                color: AppColors.primaryColor,
                child: CustomPaint(
                  painter: DottedLinePainter(),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text('Mumbai',
                      style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('New York',
                      style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text('BOM',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontFamily: 'roboto-bold',
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(child: DotWithPlaneIcon()),
                  SizedBox(
                    width: 20,
                  ),
                  Text('JFK ',
                      style: TextStyle(
                          color: AppColors.textColor,
                          fontSize: 14,
                          fontFamily: 'roboto-bold',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                children: [
                  Text('12:00 PM',
                      style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: Center(
                          child: Text('2 hr 30 min',
                              style: TextStyle(
                                  color: AppColors.secondaryTextColor,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold)))),
                  SizedBox(
                    width: 20,
                  ),
                  Text('12:00 AM',
                      style: TextStyle(
                          color: AppColors.secondaryTextColor,
                          fontSize: 12,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ));
  }
}

// dotted line painter
class DottedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.secondaryTextColor
      ..strokeWidth = 1;

    final max = size.width;
    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;

    while (startX < max) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);

    path.addOval(Rect.fromCircle(center: const Offset(0.0, 50), radius: 10.0));
    path.addOval(Rect.fromCircle(center: Offset(size.width, 50), radius: 10.0));

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
