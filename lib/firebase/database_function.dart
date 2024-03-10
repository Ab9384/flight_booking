import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flight/data/airport_data.dart';
import 'package:flight/model/airport_model.dart';

class DatabaseFunctions {
  //  add user data to the database
  static Future<void> addUserData(Map<String, dynamic> userData) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userData["userId"])
        .set(userData);
  }

  // get user data from the database
  // static Future<UserModel> getUserData(String userId, context) async {
  //   final DocumentSnapshot documentSnapshot =
  //       await FirebaseFirestore.instance.collection("users").doc(userId).get();
  //   if (!documentSnapshot.exists) {
  //     UserModel userModel = UserModel(
  //         email: FirebaseAuth.instance.currentUser!.email!, userId: userId);
  //     await addUserData(userModel.toJson());
  //     Provider.of<AppData>(context, listen: false).setUserModel = userModel;
  //     return userModel;
  //   }
  //   Provider.of<AppData>(context, listen: false).setUserModel =
  //       UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  //   return UserModel.fromJson(documentSnapshot.data() as Map<String, dynamic>);
  // }

  // update user data
  static Future<void> updateUserData(
      Map<String, dynamic> userData, String userId) async {
    await FirebaseFirestore.instance
        .collection("users")
        .doc(userId)
        .set(userData, SetOptions(merge: true));
  }

  // search airports by code, name, or city
  static List<AirportModel> searchAirports(String query) {
    Map<String, Map<String, Object>> json = airportJson;
    query = query.toLowerCase();
    List<AirportModel> searchResults = [];
    json.forEach((key, value) {
      if (key.contains(query) ||
          value["name"].toString().toLowerCase().contains(query) ||
          value["city"].toString().toLowerCase().contains(query) ||
          value["country"].toString().toLowerCase().contains(query) ||
          value["iata"].toString().toLowerCase().contains(query)) {
        searchResults.add(AirportModel.fromJson(value));
      }
    });
    return searchResults;
  }
}
