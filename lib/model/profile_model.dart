// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    int status;
    String message;
    Data data;
    Error error;

    ProfileModel({
        required this.status,
        required this.message,
        required this.data,
        required this.error,
    });

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
        error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
        "error": error.toJson(),
    };
}

class Data {
    String id;
    String fullName;
    String email;
    String phoneNumber;
    String whatsappNumber;
    String dateOfBirth;
    String gender;
    String country;
    String state;
    String city;
    int userType;
    bool isActive;
    bool isVerify;
    int otp;
    DateTime otpCreateTime;
    bool isBlock;
    dynamic createdBy;
    DateTime createdAt;
    DateTime updatedAt;
    int v;

    Data({
        required this.id,
        required this.fullName,
        required this.email,
        required this.phoneNumber,
        required this.whatsappNumber,
        required this.dateOfBirth,
        required this.gender,
        required this.country,
        required this.state,
        required this.city,
        required this.userType,
        required this.isActive,
        required this.isVerify,
        required this.otp,
        required this.otpCreateTime,
        required this.isBlock,
        required this.createdBy,
        required this.createdAt,
        required this.updatedAt,
        required this.v,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["_id"],
        fullName: json["fullName"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        whatsappNumber: json["whatsappNumber"],
        dateOfBirth: json["dateOfBirth"],
        gender: json["gender"],
        country: json["country"],
        state: json["state"],
        city: json["city"],
        userType: json["userType"],
        isActive: json["isActive"],
        isVerify: json["isVerify"],
        otp: json["otp"],
        otpCreateTime: DateTime.parse(json["otpCreateTime"]),
        isBlock: json["isBlock"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "whatsappNumber": whatsappNumber,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "country": country,
        "state": state,
        "city": city,
        "userType": userType,
        "isActive": isActive,
        "isVerify": isVerify,
        "otp": otp,
        "otpCreateTime": otpCreateTime.toIso8601String(),
        "isBlock": isBlock,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
    };
}

class Error {
    Error();

    factory Error.fromJson(Map<String, dynamic> json) => Error(
    );

    Map<String, dynamic> toJson() => {
    };
}
