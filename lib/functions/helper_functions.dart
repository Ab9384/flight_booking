// import 'dart:convert';
// import 'dart:io';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class HelperFunctions {
//   // Read data from a JSON file in chunks
//   static Future<void> readJsonFileInChunks() async {
//     final filePath =
//         'assets/json/airports.json'; // Replace with your JSON file path
//     final file = await rootBundle.loadString(filePath);

//     List<dynamic> jsonData = json.decode(file);
//     int chunkSize = 1000;

//     for (int i = 0; i < jsonData.length; i += chunkSize) {
//       int end =
//           (i + chunkSize < jsonData.length) ? i + chunkSize : jsonData.length;
//       List<dynamic> chunk = jsonData.sublist(i, end);
//       await addDataToFirebase(chunk);
//     }
//   }

// // Add data to Firebase
//   static Future<void> addDataToFirebase(List<dynamic> dataMap) async {
//     CollectionReference airportsCollection =
//         FirebaseFirestore.instance.collection('airports');

//     dataMap.forEach((element) async {
//       await airportsCollection.add(element);
//     });
//   }
// }
