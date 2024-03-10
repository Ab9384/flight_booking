import 'dart:math';

import 'package:flight/model/airport_model.dart';
import 'package:flight/model/flight_model.dart';

class FlightData {
  static List<FlightDetails> generateFlights({
    required int count,
    required AirportModel departure,
    required AirportModel arrival,
  }) {
    return List.generate(
      count,
      (index) {
        final flightClass = _generateFlightClass();
        final price = _generatePrice('Economy');
        String airline = generateAirline();
        return FlightDetails(
          ticketId: 'T${index + 1}',
          departure: departure,
          arrival: arrival,
          departureTime:
              DateTime.now().add(Duration(days: Random().nextInt(30))),
          arrivalTime: DateTime.now().add(Duration(days: Random().nextInt(30))),
          duration: '${Random().nextInt(24)}h ${Random().nextInt(60)}m',
          airline: airline,
          flightClass: flightClass,
          flightNumber: 'F${Random().nextInt(1000)}',
          price: price,
        );
      },
    );
  }

  static String _generateFlightClass() {
    final classIndex = Random().nextInt(4);
    switch (classIndex) {
      case 0:
        return 'Business';
      case 1:
        return 'Economy';
      case 2:
        return 'Premium Economy';
      case 3:
        return 'First Class';
      default:
        return 'Economy'; // Default to Economy
    }
  }

  static double _generatePrice(String flightClass) {
    switch (flightClass) {
      case 'Business':
        return Random().nextInt(50000) + 50000;
      case 'Economy':
        return Random().nextInt(30000) + 2000;
      case 'Premium Economy':
        return Random().nextInt(40000) + 25000;
      case 'First Class':
        return Random().nextInt(100000) + 75000;
      default:
        return Random().nextInt(30000) + 2000; // Default to Economy
    }
  }

  static List<String> airlines = [
    'Air Asia',
    'Air France',
    'Air India',
    'American Airlines',
    'Delta Airlines',
    'Emirates',
    'IndiGo',
    'Etihad Airways',
    'Malaysia Airlines',
    'Qatar Airways',
    'Thai Airways',
  ];

  static String generateAirline() {
    return airlines[Random().nextInt(airlines.length)];
  }

  static String airlineLogo(String airline) {
    switch (airline) {
      case 'Air Asia':
        return 'assets/airlines/air_asia.png';
      case 'Air France':
        return 'assets/airlines/air_france.png';
      case 'Air India':
        return 'assets/airlines/air_india.png';
      case 'American Airlines':
        return 'assets/airlines/american.png';
      case 'Delta Airlines':
        return 'assets/airlines/delta.png';
      case 'Emirates':
        return 'assets/airlines/emirates.png';
      case 'IndiGo':
        return 'assets/airlines/indigo.png';
      case 'Etihad Airways':
        return 'assets/airlines/etihad.png';
      case 'Malaysia Airlines':
        return 'assets/airlines/malaysia.png';
      case 'Qatar Airways':
        return 'assets/airlines/qatar.png';
      case 'Thai Airways':
        return 'assets/airlines/thai.png';
      default:
        return 'assets/airlines/air_asia.png';
    }
  }
}
