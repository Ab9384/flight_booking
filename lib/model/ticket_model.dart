class TicketDetails {
  final String ticketId;
  final String departure;
  final String arrival;
  final DateTime departureTime;
  final DateTime arrivalTime;
  final String duration;
  final String airline;
  final String flightClass;
  final String flightNumber;
  final String price;

  TicketDetails({
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

  factory TicketDetails.fromJson(Map<String, dynamic> json) {
    return TicketDetails(
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
