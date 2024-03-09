import 'package:flight/model/airport_model.dart';
import 'package:flight/model/user_model.dart';
import 'package:flutter/material.dart';

class AppData extends ChangeNotifier {
  UserModel? _userModel;

  UserModel? get userModel => _userModel;

  set setUserModel(UserModel userModel) {
    _userModel = userModel;
    notifyListeners();
  }

  AirportModel?
      _selectedDepartureAirport; // selected departure airport from the list

  AirportModel? get selectedDepartureAirport => _selectedDepartureAirport;

  set setSelectedDepartureAirport(AirportModel selectedDepartureAirport) {
    _selectedDepartureAirport = selectedDepartureAirport;
    notifyListeners();
  }

  AirportModel?
      _selectedArrivalAirport; // selected arrival airport from the list

  AirportModel? get selectedArrivalAirport => _selectedArrivalAirport;

  set setSelectedArrivalAirport(AirportModel selectedArrivalAirport) {
    _selectedArrivalAirport = selectedArrivalAirport;
    notifyListeners();
  }

  DateTime? _departureDate; // selected departure date

  DateTime? get departureDate => _departureDate;

  set setDepartureDate(DateTime departureDate) {
    _departureDate = departureDate;
    notifyListeners();
  }

  DateTime? _returnDate; // selected return date

  DateTime? get returnDate => _returnDate;

  set setReturnDate(DateTime returnDate) {
    _returnDate = returnDate;
    notifyListeners();
  }

  int _passengerCount = 1; // selected passenger count

  int get passengerCount => _passengerCount;

  set setPassengerCount(int passengerCount) {
    _passengerCount = passengerCount;
    notifyListeners();
  }

  String? _selectedClass; // selected class

  String? get selectedClass => _selectedClass;

  set setSelectedClass(String selectedClass) {
    _selectedClass = selectedClass;
    notifyListeners();
  }
}
