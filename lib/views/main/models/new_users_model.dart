// To parse this JSON data, do
//
//     final newUsersModel = newUsersModelFromJson(jsonString);

import 'dart:convert';

NewUsersModel newUsersModelFromJson(String str) => NewUsersModel.fromJson(json.decode(str));

String newUsersModelToJson(NewUsersModel data) => json.encode(data.toJson());

class NewUsersModel {
    bool result;
    List<Datum> data;

    NewUsersModel({
        required this.result,
        required this.data,
    });

    factory NewUsersModel.fromJson(Map<String, dynamic> json) => NewUsersModel(
        result: json["result"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String phone;
    int status;
    int? staffId;
    DateTime createdAt;
    DateTime updatedAt;

    Datum({
        required this.id,
        required this.name,
        required this.phone,
        required this.status,
        required this.staffId,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 999,
        name: json["name"] ?? "No Data",
        phone: json["phone"] ?? "No Data",
        status: json["status"] ?? 999,
        staffId: json["staff_id"] ?? 999,
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "status": status,
        "staff_id": staffId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
