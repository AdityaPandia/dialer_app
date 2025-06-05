// // To parse this JSON data, do
// //
// //     final memberModel = memberModelFromJson(jsonString);

// import 'dart:convert';

// MemberModel memberModelFromJson(String str) => MemberModel.fromJson(json.decode(str));

// String memberModelToJson(MemberModel data) => json.encode(data.toJson());

// class MemberModel {
//     Data data;

//     MemberModel({
//         required this.data,
//     });

//     factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//     };
// }

// class Data {
//     Map<String, int> memberStatusValues;
//     int freeMember;
//     int paidMember;
//     List<dynamic> today;
//     List<dynamic> yesterday;
//     List<dynamic> tomorrow;
//     List<Total> total;
//     int todayPending;

//     Data({
//         required this.memberStatusValues,
//         required this.freeMember,
//         required this.paidMember,
//         required this.today,
//         required this.yesterday,
//         required this.tomorrow,
//         required this.total,
//         required this.todayPending,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         memberStatusValues: Map.from(json["member_status_values"]).map((k, v) => MapEntry<String, int>(k, v)),
//         freeMember: json["free_member"],
//         paidMember: json["paid_member"],
//         today: List<dynamic>.from(json["today"].map((x) => x)),
//         yesterday: List<dynamic>.from(json["yesterday"].map((x) => x)),
//         tomorrow: List<dynamic>.from(json["tomorrow"].map((x) => x)),
//         total: List<Total>.from(json["total"].map((x) => Total.fromJson(x))),
//         todayPending: json["today_pending"],
//     );

//     Map<String, dynamic> toJson() => {
//         "member_status_values": Map.from(memberStatusValues).map((k, v) => MapEntry<String, dynamic>(k, v)),
//         "free_member": freeMember,
//         "paid_member": paidMember,
//         "today": List<dynamic>.from(today.map((x) => x)),
//         "yesterday": List<dynamic>.from(yesterday.map((x) => x)),
//         "tomorrow": List<dynamic>.from(tomorrow.map((x) => x)),
//         "total": List<dynamic>.from(total.map((x) => x.toJson())),
//         "today_pending": todayPending,
//     };
// }

// class Total {
//     int id;
//     int staffId;
//     int userId;
//     DateTime nextFollowUp;
//     String comment;
//     int memberStatus;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Total({
//         required this.id,
//         required this.staffId,
//         required this.userId,
//         required this.nextFollowUp,
//         required this.comment,
//         required this.memberStatus,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Total.fromJson(Map<String, dynamic> json) => Total(
//         id: json["id"],
//         staffId: json["staff_id"],
//         userId: json["user_id"],
//         nextFollowUp: DateTime.parse(json["next_follow_up"]),
//         comment: json["comment"] ?? "No Comment",
//         memberStatus: json["member_status"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "staff_id": staffId,
//         "user_id": userId,
//         "next_follow_up": nextFollowUp.toIso8601String(),
//         "comment": comment,
//         "member_status": memberStatus,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// To parse this JSON data, do
//
//     final memberModel = memberModelFromJson(jsonString);

import 'dart:convert';

MemberModel memberModelFromJson(String str) =>
    MemberModel.fromJson(json.decode(str));

String memberModelToJson(MemberModel data) => json.encode(data.toJson());

class MemberModel {
  Data? data;

  MemberModel({
    this.data,
  });

  factory MemberModel.fromJson(Map<String, dynamic> json) => MemberModel(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
      };
}

class Data {
  Map<String, int>? memberStatusValues;
  int? freeMember;
  int? paidMember;
  List<dynamic>? today;
  List<dynamic>? yesterday;
  List<dynamic>? tomorrow;
  List<Total>? total;
  int? todayPending;

  Data({
    this.memberStatusValues,
    this.freeMember,
    this.paidMember,
    this.today,
    this.yesterday,
    this.tomorrow,
    this.total,
    this.todayPending,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        memberStatusValues: json["member_status_values"] == null
            ? null
            : Map<String, int>.from(json["member_status_values"]
                .map((k, v) => MapEntry<String, int>(k, v ?? 0))),
        freeMember: json["free_member"] ?? 0,
        paidMember: json["paid_member"] ?? 0,
        today: json["today"] == null
            ? null
            : List<dynamic>.from(json["today"].map((x) => x)),
        yesterday: json["yesterday"] == null
            ? null
            : List<dynamic>.from(json["yesterday"].map((x) => x)),
        tomorrow: json["tomorrow"] == null
            ? null
            : List<dynamic>.from(json["tomorrow"].map((x) => x)),
        total: json["total"] == null
            ? null
            : List<Total>.from(json["total"].map((x) => Total.fromJson(x))),
        todayPending: json["today_pending"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "member_status_values": memberStatusValues == null
            ? null
            : Map.from(memberStatusValues!)
                .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "free_member": freeMember,
        "paid_member": paidMember,
        "today":
            today == null ? null : List<dynamic>.from(today!.map((x) => x)),
        "yesterday": yesterday == null
            ? null
            : List<dynamic>.from(yesterday!.map((x) => x)),
        "tomorrow": tomorrow == null
            ? null
            : List<dynamic>.from(tomorrow!.map((x) => x)),
        "total": total == null
            ? null
            : List<dynamic>.from(total!.map((x) => x.toJson())),
        "today_pending": todayPending,
      };
}

class Total {
  int? id;
  int? staffId;
  int? userId;
  DateTime? nextFollowUp;
  String? comment;
  int? memberStatus;
  DateTime? createdAt;
  DateTime? updatedAt;
  String ? firstName;
  String ? lastName;
  String ? phone;

  Total({
    this.id,
    this.staffId,
    this.userId,
    this.nextFollowUp,
    this.comment,
    this.memberStatus,
    this.createdAt,
    this.updatedAt,
    this.firstName,
    this.lastName,
    this.phone,
  });

  factory Total.fromJson(Map<String, dynamic> json) => Total(
        firstName: json["first_name"] ?? "Name N/A",
        lastName: json["last_name"] ?? "",
        phone: json["phone"] ?? "Phone N/A",
        id: json["id"] ?? 0,
        staffId: json["staff_id"] ?? 0,
        userId: json["user_id"] ?? 0,
        nextFollowUp: json["next_follow_up"] == null
            ? null
            : DateTime.tryParse(json["next_follow_up"]),
        comment: json["comment"] ?? "No Comment",
        memberStatus: json["member_status"] ?? 0,
        createdAt: json["created_at"] == null
            ? null
            : DateTime.tryParse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.tryParse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "staff_id": staffId,
        "user_id": userId,
        "next_follow_up": nextFollowUp?.toIso8601String(),
        "comment": comment,
        "member_status": memberStatus,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
