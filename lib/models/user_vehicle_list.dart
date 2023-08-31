// To parse this JSON data, do
//
//     final userVehicleListModel = userVehicleListModelFromJson(jsonString);

import 'dart:convert';

UserVehicleListModel userVehicleListModelFromJson(String str) =>
    UserVehicleListModel.fromJson(json.decode(str));

String userVehicleListModelToJson(UserVehicleListModel data) =>
    json.encode(data.toJson());

class UserVehicleListModel {
  int total;
  List<Item> items;

  UserVehicleListModel({
    required this.total,
    required this.items,
  });

  factory UserVehicleListModel.fromJson(Map<String, dynamic> json) =>
      UserVehicleListModel(
        total: json["total"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  String id;
  Type type;
  bool isReleased;
  List<String> images;
  List<String> customFeatures;
  int status;
  PostedVia postedVia;
  int certified;
  Make make;
  String model;
  String variant;
  Location location;
  int mileage;
  int year;
  String registrationNumber;
  String registrationCity;
  TransactionType transactionType;
  int? price;
  String? transmission;
  String interiorColor;
  String exteriorColor;
  Condition? condition;
  Category category;
  User user;
  InspectionType inspectionType;
  String itemId;
  String name;
  String? image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  int? numberOfViews;
  int? numberOfCallClicks;
  int? numberOfProfileClicks;
  String? description;

  Item({
    required this.id,
    required this.type,
    required this.isReleased,
    required this.images,
    required this.customFeatures,
    required this.status,
    required this.postedVia,
    required this.certified,
    required this.make,
    required this.model,
    required this.variant,
    required this.location,
    required this.mileage,
    required this.year,
    required this.registrationNumber,
    required this.registrationCity,
    required this.transactionType,
    this.price,
    this.transmission,
    required this.interiorColor,
    required this.exteriorColor,
    this.condition,
    required this.category,
    required this.user,
    required this.inspectionType,
    required this.itemId,
    required this.name,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    this.numberOfViews,
    this.numberOfCallClicks,
    this.numberOfProfileClicks,
    this.description,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        type: typeValues.map[json["type"]]!,
        isReleased: json["isReleased"],
        images: List<String>.from(json["images"].map((x) => x)),
        customFeatures: List<String>.from(json["customFeatures"].map((x) => x)),
        status: json["status"],
        postedVia: postedViaValues.map[json["postedVia"]]!,
        certified: json["certified"],
        make: makeValues.map[json["make"]]!,
        model: json["model"],
        variant: json["variant"],
        location: Location.fromJson(json["location"]),
        mileage: json["mileage"],
        year: json["year"],
        registrationNumber: json["registrationNumber"],
        registrationCity: json["registrationCity"],
        transactionType: transactionTypeValues.map[json["transactionType"]]!,
        price: json["price"],
        transmission: json["transmission"],
        interiorColor: json["interiorColor"],
        exteriorColor: json["exteriorColor"],
        condition: json["condition"] == null
            ? null
            : Condition.fromJson(json["condition"]),
        category: categoryValues.map[json["category"]]!,
        user: User.fromJson(json["user"]),
        inspectionType: inspectionTypeValues.map[json["inspectionType"]]!,
        itemId: json["id"],
        name: json["name"],
        image: json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        numberOfViews: json["numberOfViews"],
        numberOfCallClicks: json["numberOfCallClicks"],
        numberOfProfileClicks: json["numberOfProfileClicks"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "type": typeValues.reverse[type],
        "isReleased": isReleased,
        "images": List<dynamic>.from(images.map((x) => x)),
        "customFeatures": List<dynamic>.from(customFeatures.map((x) => x)),
        "status": status,
        "postedVia": postedViaValues.reverse[postedVia],
        "certified": certified,
        "make": makeValues.reverse[make],
        "model": model,
        "variant": variant,
        "location": location.toJson(),
        "mileage": mileage,
        "year": year,
        "registrationNumber": registrationNumber,
        "registrationCity": registrationCity,
        "transactionType": transactionTypeValues.reverse[transactionType],
        "price": price,
        "transmission": transmission,
        "interiorColor": interiorColor,
        "exteriorColor": exteriorColor,
        "condition": condition?.toJson(),
        "category": categoryValues.reverse[category],
        "user": user.toJson(),
        "inspectionType": inspectionTypeValues.reverse[inspectionType],
        "id": itemId,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "numberOfViews": numberOfViews,
        "numberOfCallClicks": numberOfCallClicks,
        "numberOfProfileClicks": numberOfProfileClicks,
        "description": description,
      };
}

enum Category { CAR }

final categoryValues = EnumValues({"car": Category.CAR});

class Condition {
  int interior;
  int exterior;
  int engine;
  int transmission;
  int tyres;
  int suspension;

  Condition({
    required this.interior,
    required this.exterior,
    required this.engine,
    required this.transmission,
    required this.tyres,
    required this.suspension,
  });

  factory Condition.fromJson(Map<String, dynamic> json) => Condition(
        interior: json["interior"],
        exterior: json["exterior"],
        engine: json["engine"],
        transmission: json["transmission"],
        tyres: json["tyres"],
        suspension: json["suspension"],
      );

  Map<String, dynamic> toJson() => {
        "interior": interior,
        "exterior": exterior,
        "engine": engine,
        "transmission": transmission,
        "tyres": tyres,
        "suspension": suspension,
      };
}

enum InspectionType { SELLER }

final inspectionTypeValues = EnumValues({"seller": InspectionType.SELLER});

class Location {
  Region region;
  String city;

  Location({
    required this.region,
    required this.city,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        region: regionValues.map[json["region"]]!,
        city: json["city"],
      );

  Map<String, dynamic> toJson() => {
        "region": regionValues.reverse[region],
        "city": city,
      };
}

enum Region { PK }

final regionValues = EnumValues({"PK": Region.PK});

enum Make { HONDA }

final makeValues = EnumValues({"Honda": Make.HONDA});

enum PostedVia { WEB }

final postedViaValues = EnumValues({"web": PostedVia.WEB});

enum TransactionType { CASH, CALL_FOR_PRICE, LEASED }

final transactionTypeValues = EnumValues({
  "call for price": TransactionType.CALL_FOR_PRICE,
  "cash": TransactionType.CASH,
  "leased": TransactionType.LEASED
});

enum Type { USED, NEW }

final typeValues = EnumValues({"new": Type.NEW, "used": Type.USED});

class User {
  Id id;
  dynamic contactNumber;

  User({
    required this.id,
    this.contactNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: idValues.map[json["_id"]]!,
        contactNumber: json["contactNumber"],
      );

  Map<String, dynamic> toJson() => {
        "_id": idValues.reverse[id],
        "contactNumber": contactNumber,
      };
}

enum Id { THE_6015_C1_CD7_E9_C8_D732_A35_DC24 }

final idValues = EnumValues(
    {"6015c1cd7e9c8d732a35dc24": Id.THE_6015_C1_CD7_E9_C8_D732_A35_DC24});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
