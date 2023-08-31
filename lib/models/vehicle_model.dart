// To parse this JSON data, do
//
//     final vehicleModel = vehicleModelFromJson(jsonString);

import 'dart:convert';

VehicleModel vehicleModelFromJson(String str) =>
    VehicleModel.fromJson(json.decode(str));

String vehicleModelToJson(VehicleModel data) => json.encode(data.toJson());

class VehicleModel {
  List<Maker> makers;
  List<Model> models;

  VehicleModel({
    required this.makers,
    required this.models,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) => VehicleModel(
        makers: List<Maker>.from(json["makers"].map((x) => Maker.fromJson(x))),
        models: List<Model>.from(json["models"].map((x) => Model.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "makers": List<dynamic>.from(makers.map((x) => x.toJson())),
        "models": List<dynamic>.from(models.map((x) => x.toJson())),
      };
}

class Maker {
  String id;
  String? fullName;
  int? priority;
  int? numberOfCars;
  DateTime? updatedAt;
  dynamic numberOfCashCarsActive;
  bool? dealExists;
  String? image;
  int? numberOfCallForPriceActive;
  int? numberOfCallForPriceInactive;
  int? numberOfInactiveCars;
  int? numberOfLeasedCarsActive;
  int? numberOfCashCarsInactive;
  int? numberOfCashCarsSold;
  int? numberOfSoldCars;
  int? numberOfLeasedCarsInactive;
  int? v;
  String? fullNmae;
  DateTime? createdAt;
  int? numberOfLeasedCarsSold;
  int? numberOfCallForPriceSold;
  String? fullname;

  Maker({
    required this.id,
    this.fullName,
    this.priority,
    this.numberOfCars,
    this.updatedAt,
    this.numberOfCashCarsActive,
    this.dealExists,
    this.image,
    this.numberOfCallForPriceActive,
    this.numberOfCallForPriceInactive,
    this.numberOfInactiveCars,
    this.numberOfLeasedCarsActive,
    this.numberOfCashCarsInactive,
    this.numberOfCashCarsSold,
    this.numberOfSoldCars,
    this.numberOfLeasedCarsInactive,
    this.v,
    this.fullNmae,
    this.createdAt,
    this.numberOfLeasedCarsSold,
    this.numberOfCallForPriceSold,
    this.fullname,
  });

  factory Maker.fromJson(Map<String, dynamic> json) => Maker(
        id: json["_id"],
        fullName: json["fullName"],
        priority: json["priority"],
        numberOfCars: json["numberOfCars"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        numberOfCashCarsActive: json["numberOfCashCarsActive"],
        dealExists: json["dealExists"],
        image: json["image"],
        numberOfCallForPriceActive: json["numberOfCallForPriceActive"],
        numberOfCallForPriceInactive: json["numberOfCallForPriceInactive"],
        numberOfInactiveCars: json["numberOfInactiveCars"],
        numberOfLeasedCarsActive: json["numberOfLeasedCarsActive"],
        numberOfCashCarsInactive: json["numberOfCashCarsInactive"],
        numberOfCashCarsSold: json["numberOfCashCarsSold"],
        numberOfSoldCars: json["numberOfSoldCars"],
        numberOfLeasedCarsInactive: json["numberOfLeasedCarsInactive"],
        v: json["__v"],
        fullNmae: json["fullNmae"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        numberOfLeasedCarsSold: json["numberOfLeasedCarsSold"],
        numberOfCallForPriceSold: json["numberOfCallForPriceSold"],
        fullname: json["fullname"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "priority": priority,
        "numberOfCars": numberOfCars,
        "updatedAt": updatedAt?.toIso8601String(),
        "numberOfCashCarsActive": numberOfCashCarsActive,
        "dealExists": dealExists,
        "image": image,
        "numberOfCallForPriceActive": numberOfCallForPriceActive,
        "numberOfCallForPriceInactive": numberOfCallForPriceInactive,
        "numberOfInactiveCars": numberOfInactiveCars,
        "numberOfLeasedCarsActive": numberOfLeasedCarsActive,
        "numberOfCashCarsInactive": numberOfCashCarsInactive,
        "numberOfCashCarsSold": numberOfCashCarsSold,
        "numberOfSoldCars": numberOfSoldCars,
        "numberOfLeasedCarsInactive": numberOfLeasedCarsInactive,
        "__v": v,
        "fullNmae": fullNmae,
        "createdAt": createdAt?.toIso8601String(),
        "numberOfLeasedCarsSold": numberOfLeasedCarsSold,
        "numberOfCallForPriceSold": numberOfCallForPriceSold,
        "fullname": fullname,
      };
}

class Model {
  String id;
  String name;
  String make;
  int yearStart;
  int? numberOfCars;
  DateTime? updatedAt;
  int? numberOfInactiveCars;
  int? numberOfCashCarsActive;
  bool? dealExists;
  List<int>? dealYearList;
  int? numberOfCashCarsInactive;
  int? modelNumberOfInactiveCars;
  int? numberOfCashCarsSold;
  int? numberOfSoldCars;
  int? numberOfLeasedCarsActive;
  int? numberOfCallForPriceActive;
  int? numberOfCallForPriceInactive;
  DateTime? createdAt;
  int? v;
  int? numberOfLeasedCarsInactive;
  int? numberOfLeasedCarsSold;
  int? numberOfCallForPriceSold;
  int? priority;

  Model({
    required this.id,
    required this.name,
    required this.make,
    required this.yearStart,
    this.numberOfCars,
    this.updatedAt,
    this.numberOfInactiveCars,
    this.numberOfCashCarsActive,
    this.dealExists,
    this.dealYearList,
    this.numberOfCashCarsInactive,
    this.modelNumberOfInactiveCars,
    this.numberOfCashCarsSold,
    this.numberOfSoldCars,
    this.numberOfLeasedCarsActive,
    this.numberOfCallForPriceActive,
    this.numberOfCallForPriceInactive,
    this.createdAt,
    this.v,
    this.numberOfLeasedCarsInactive,
    this.numberOfLeasedCarsSold,
    this.numberOfCallForPriceSold,
    this.priority,
  });

  factory Model.fromJson(Map<String, dynamic> json) => Model(
        id: json["_id"],
        name: json["name"],
        make: json["make"],
        yearStart: json["yearStart"],
        numberOfCars: json["numberOfCars"],
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        numberOfInactiveCars: json["numberOFInactiveCars"],
        numberOfCashCarsActive: json["numberOfCashCarsActive"],
        dealExists: json["dealExists"],
        dealYearList: json["dealYearList"] == null
            ? []
            : List<int>.from(json["dealYearList"]!.map((x) => x)),
        numberOfCashCarsInactive: json["numberOfCashCarsInactive"],
        modelNumberOfInactiveCars: json["numberOfInactiveCars"],
        numberOfCashCarsSold: json["numberOfCashCarsSold"],
        numberOfSoldCars: json["numberOfSoldCars"],
        numberOfLeasedCarsActive: json["numberOfLeasedCarsActive"],
        numberOfCallForPriceActive: json["numberOfCallForPriceActive"],
        numberOfCallForPriceInactive: json["numberOfCallForPriceInactive"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        v: json["__v"],
        numberOfLeasedCarsInactive: json["numberOfLeasedCarsInactive"],
        numberOfLeasedCarsSold: json["numberOfLeasedCarsSold"],
        numberOfCallForPriceSold: json["numberOfCallForPriceSold"],
        priority: json["priority"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "make": make,
        "yearStart": yearStart,
        "numberOfCars": numberOfCars,
        "updatedAt": updatedAt?.toIso8601String(),
        "numberOFInactiveCars": numberOfInactiveCars,
        "numberOfCashCarsActive": numberOfCashCarsActive,
        "dealExists": dealExists,
        "dealYearList": dealYearList == null
            ? []
            : List<dynamic>.from(dealYearList!.map((x) => x)),
        "numberOfCashCarsInactive": numberOfCashCarsInactive,
        "numberOfInactiveCars": modelNumberOfInactiveCars,
        "numberOfCashCarsSold": numberOfCashCarsSold,
        "numberOfSoldCars": numberOfSoldCars,
        "numberOfLeasedCarsActive": numberOfLeasedCarsActive,
        "numberOfCallForPriceActive": numberOfCallForPriceActive,
        "numberOfCallForPriceInactive": numberOfCallForPriceInactive,
        "createdAt": createdAt?.toIso8601String(),
        "__v": v,
        "numberOfLeasedCarsInactive": numberOfLeasedCarsInactive,
        "numberOfLeasedCarsSold": numberOfLeasedCarsSold,
        "numberOfCallForPriceSold": numberOfCallForPriceSold,
        "priority": priority,
      };
}
