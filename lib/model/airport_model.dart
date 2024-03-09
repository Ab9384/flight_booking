class AirportModel {
  // "00AK": {
  //     "icao": "00AK",
  //     "iata": "",
  //     "name": "Lowell Field",
  //     "city": "Anchor Point",
  //     "state": "Alaska",
  //     "country": "US",
  //     "elevation": 450,
  //     "lat": 59.94919968,
  //     "lon": -151.695999146,
  //     "tz": "America\/Anchorage"
  // },

  String icao;
  String? iata;
  String name;
  String city;
  String state;
  String country;
  int elevation;
  double lat;
  double lon;
  String tz;

  AirportModel({
    required this.icao,
    this.iata,
    required this.name,
    required this.city,
    required this.state,
    required this.country,
    required this.elevation,
    required this.lat,
    required this.lon,
    required this.tz,
  });

  factory AirportModel.fromJson(Map<String, dynamic> json) {
    return AirportModel(
      icao: json['icao'],
      iata: json['iata'],
      name: json['name'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      elevation: json['elevation'],
      lat: json['lat'],
      lon: json['lon'],
      tz: json['tz'],
    );
  }
}
