// To parse this JSON data, do
//
//     final courseModel = courseModelFromJson(jsonString);

import 'dart:convert';

CourseModel courseModelFromJson(String str) => CourseModel.fromJson(json.decode(str));

String courseModelToJson(CourseModel data) => json.encode(data.toJson());

class CourseModel {
    int status;
    String message;
    List<Datum> data;
    Error error;

    CourseModel({
        required this.status,
        required this.message,
        required this.data,
        required this.error,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        error: Error.fromJson(json["error"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "error": error.toJson(),
    };
}

class Datum {
    List<String> image;
    String? dayValidity;
    String? minimumRequiredCapital;
    String? returnOninvestment;
    String id;
    String courseName;
    String description;
    String enrollmentCharge;
    bool isActive;
    bool isBlock;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.image,
        required this.dayValidity,
        required this.minimumRequiredCapital,
        required this.returnOninvestment,
        required this.id,
        required this.courseName,
        required this.description,
        required this.enrollmentCharge,
        required this.isActive,
        required this.isBlock,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        image: List<String>.from(json["image"].map((x) => x)),
        dayValidity: json["dayValidity"],
        minimumRequiredCapital: json["minimumRequiredCapital"],
        returnOninvestment: json["returnOninvestment"],
        id: json["_id"],
        courseName: json["courseName"],
        description: json["description"],
        enrollmentCharge: json["enrollmentCharge"],
        isActive: json["isActive"],
        isBlock: json["isBlock"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "image": List<dynamic>.from(image.map((x) => x)),
        "dayValidity": dayValidity,
        "minimumRequiredCapital": minimumRequiredCapital,
        "returnOninvestment": returnOninvestment,
        "_id": id,
        "courseName": courseName,
        "description": description,
        "enrollmentCharge": enrollmentCharge,
        "isActive": isActive,
        "isBlock": isBlock,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
    };
}

class Error {
    Error();

    factory Error.fromJson(Map<String, dynamic> json) => Error(
    );

    Map<String, dynamic> toJson() => {
    };
}
