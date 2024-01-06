import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String? fullName;
  final String? email;
  final String? phoneNumber;
  final String? whatsappNumber;
  final String? dateOfBirth;
  final String? gender;
  final String? country;
  final String? state;
  final String? city;

  const UserModel({
    this.id,
    this.fullName,
    this.email,
    this.phoneNumber,
    this.whatsappNumber,
    this.dateOfBirth,
    this.gender,
    this.country,
    this.state,
    this.city,
  });
  
  toJson(){
    return {
      "FullName": fullName,
      "Email": email,
      "PhoneNumber": phoneNumber,
      "WhatsAppNumber": whatsappNumber,
      "DateOfBirth": dateOfBirth,
      "Gender": gender,
      "Country": country,
      "State": state,
      "City": city,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> documnet) {
    final data = documnet.data()!;
    return UserModel(
    id: documnet.id,
    fullName: data["FullName"],
    email:data["Email"],
    phoneNumber:data["PhoneNumber"],
    whatsappNumber:data["WhatsAppNumber"],
    dateOfBirth:data["DateOfBirth"],
    gender:data["Gender"],
    country:data["Country"],
    state:data["State"],
    city:data["City"],

    );

  }
}