import 'package:flight/utils/global_variable.dart';

class UserModel {
  String? userId;
  String? name;
  String? email;
  String? gender;
  String? dateOfBirth;
  String? phoneNumber;
  String? profilePhoto;

  UserModel(
      {this.userId,
      this.name,
      this.email,
      this.dateOfBirth,
      this.gender,
      this.profilePhoto,
      this.phoneNumber});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    email = json['email'];
    profilePhoto = json['profilePhoto'] ??
        (json['gender'].toString().toLowerCase() == 'female'
            ? femaleAvatar
            : maleAvatar);
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['name'] = name;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['email'] = email;
    data['profilePhoto'] = profilePhoto;
    data['phoneNumber'] = phoneNumber;
    return data;
  }
}
