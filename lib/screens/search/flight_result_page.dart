import 'package:flight/data/flight_data.dart';
import 'package:flight/model/flight_model.dart';
import 'package:flight/provider/app_data.dart';
import 'package:flight/utils/app_colors.dart';
import 'package:flight/widgets/dot_with_plane_icon.dart';
import 'package:flight/widgets/flight_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FlightResultPage extends StatefulWidget {
  const FlightResultPage({super.key});

  @override
  State<FlightResultPage> createState() => _FlightResultPageState();
}

class _FlightResultPageState extends State<FlightResultPage> {
  List<FlightDetails> flights = [];
  List<FlightDetails> filteredFlights = [];

  @override
  void initState() {
    var data = Provider.of<AppData>(context, listen: false);
    setState(() {
      flights = FlightData.generateFlights(
          count: 20,
          departure: data.selectedDepartureAirport!,
          arrival: data.selectedArrivalAirport!);
      filteredFlights = flights;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<AppData>(context);
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: 230,
                width: double.infinity,
                color: AppColors.primaryColor,
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 230 - MediaQuery.of(context).padding.top,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        child: AppBar(
                            surfaceTintColor: AppColors.primaryColor,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            leading: BackButton(
                              color: AppColors.backgroundColor,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            centerTitle: true,
                            title: const Text(
                              'Select Flight',
                              style: TextStyle(
                                color: AppColors.backgroundColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data.selectedDepartureAirport!.iata ??
                                        data.selectedDepartureAirport!.icao,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Expanded(
                                    flex: 2, child: DotWithPlaneIconWhite()),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data.selectedArrivalAirport!.iata ??
                                        data.selectedArrivalAirport!.icao,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data.selectedDepartureAirport!.name,
                                    style: const TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    data.selectedArrivalAirport!.name,
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: AppColors.backgroundColor,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '(${data.selectedDepartureAirport!.city})',
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '(${data.selectedArrivalAirport!.city})',
                                    textAlign: TextAlign.end,
                                    style: const TextStyle(
                                      color: AppColors.secondaryTextColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return FlightTile(flight: flights[index]);
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 10,
                          ),
                      itemCount: flights.length),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
