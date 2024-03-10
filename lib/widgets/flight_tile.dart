import 'package:extended_image/extended_image.dart';
import 'package:flight/data/flight_data.dart';
import 'package:flight/model/flight_model.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/utils/global_variable.dart';
import 'package:flight/widgets/dot_with_plane_icon.dart';
import 'package:flutter/material.dart';

class FlightTile extends StatelessWidget {
  final FlightDetails flight;
  const FlightTile({super.key, required this.flight});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // flight logo and airline name
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ExtendedImage.asset(
                    FlightData.airlineLogo(flight.airline),
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    flight.airline,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '₹${numberFormat.format(flight.price)}',
                style: const TextStyle(
                  fontSize: 14,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // flight details
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    flight.departure.iata ?? flight.departure.icao,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),

                  // departure time and date
                  Text(
                    dateFormat.format(flight.departureTime),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    timeFormat.format(flight.departureTime),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              Expanded(
                  child: Column(
                children: [
                  const DotWithPlaneIcon(),
                  const SizedBox(height: 5),
                  Text(
                    flight.duration,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    flight.arrival.iata ?? flight.arrival.icao,
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  // arrival time and date
                  const SizedBox(height: 5),
                  Text(
                    dateFormat.format(flight.arrivalTime),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    timeFormat.format(flight.arrivalTime),
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.secondaryTextColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
