import 'dart:math';

import 'package:flight/model/ticket_model.dart';

class DummyData {
  static List<TicketDetails> generateTickets({
    required int count,
    required String departure,
    required String arrival,
  }) {
    return List.generate(
      count,
      (index) {
        final flightClass = _generateFlightClass();
        final price = _generatePrice(flightClass);

        return TicketDetails(
          ticketId: 'T${index + 1}',
          departure: departure,
          arrival: arrival,
          departureTime:
              DateTime.now().add(Duration(days: Random().nextInt(30))),
          arrivalTime: DateTime.now().add(Duration(days: Random().nextInt(30))),
          duration: '${Random().nextInt(24)}h ${Random().nextInt(60)}m',
          airline: 'Airline${Random().nextInt(5)}',
          flightClass: flightClass,
          flightNumber: 'F${Random().nextInt(1000)}',
          price: '₹$price',
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

  static String _generatePrice(String flightClass) {
    switch (flightClass) {
      case 'Business':
        return '${Random().nextInt(50000) + 50000}';
      case 'Economy':
        return '${Random().nextInt(30000) + 2000}';
      case 'Premium Economy':
        return '${Random().nextInt(40000) + 25000}';
      case 'First Class':
        return '${Random().nextInt(100000) + 75000}';
      default:
        return '${Random().nextInt(30000) + 2000}'; // Default to Economy
    }
  }
}
