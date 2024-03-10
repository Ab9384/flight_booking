import 'package:flight/model/airport_model.dart';

class FlightDetails {
  final String ticketId;
  final AirportModel departure;
  final AirportModel arrival;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String duration;
  final String airline;
  final String flightClass;
  final String flightNumber;
  final double price;

  FlightDetails({
    required this.ticketId,
    required this.departure,
    required this.arrival,
    required this.departureTime,
    required this.arrivalTime,
    required this.duration,
    required this.airline,
    required this.flightClass,
    required this.flightNumber,
    required this.price,
  });

  factory FlightDetails.fromJson(Map<String, dynamic> json) {
    return FlightDetails(
      ticketId: json['ticketId'],
      departure: json['departure'],
      arrival: json['arrival'],
      departureTime: DateTime.parse(json['departureTime']),
      arrivalTime: DateTime.parse(json['arrivalTime']),
      duration: json['duration'],
      airline: json['airline'],
      flightClass: json['flightClass'],
      flightNumber: json['flightNumber'],
      price: json['price'],
    );
  }
}
