import 'dart:convert';

import 'package:flight/model/plane_layout.dart';

var planeLayout = {
  "plane": {
    "seats": [
      {
        "class": "Economy",
        "rows": 20,
        "seats_per_row": 6,
        "seat_layout": "3-3",
        "features": ["Standard legroom", "Basic amenities"]
      },
      {
        "class": "Premium Economy",
        "rows": 10,
        "seats_per_row": 4,
        "seat_layout": "2-2",
        "features": ["Extra legroom", "Enhanced amenities"]
      },
      {
        "class": "Business",
        "rows": 8,
        "seats_per_row": 4,
        "seat_layout": "1-2-1",
        "features": ["Lie-flat seats", "Priority boarding", "Premium amenities"]
      },
      {
        "class": "First Class",
        "rows": 4,
        "seats_per_row": 2,
        "seat_layout": "1-1",
        "features": [
          "Private suites",
          "Exclusive lounge access",
          "Luxury amenities"
        ]
      }
    ]
  }
};

// parse plane layout
List<PlaneLayout> parsePlaneJson(String jsonLayout) {
  List<PlaneLayout> planeLayouts = [];

  var decodedJson = jsonDecode(jsonLayout);
  var seats = decodedJson['plane']['seats'];

  for (var seat in seats) {
    planeLayouts.add(PlaneLayout(
      className: seat['class'],
      rows: seat['rows'],
      seatsPerRow: seat['seats_per_row'],
      seatLayout: seat['seat_layout'],
      features: List<String>.from(seat['features']),
    ));
  }

  return planeLayouts;
}
