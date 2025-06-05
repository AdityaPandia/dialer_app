// To parse this JSON data, do
//
//     final dialerApi = dialerApiFromJson(jsonString);

import 'dart:convert';

DialerApi dialerApiFromJson(String str) => DialerApi.fromJson(json.decode(str));

String dialerApiToJson(DialerApi data) => json.encode(data.toJson());

class DialerApi {
    Member member;
    Data data;
    List<PreferenceNotificationList> totNotification;
    List<PreferenceNotificationList> preferenceNotificationList;
    List<FollowupList> followupList;

    DialerApi({
        required this.member,
        required this.data,
        required this.totNotification,
        required this.preferenceNotificationList,
        required this.followupList,
    });

    factory DialerApi.fromJson(Map<String, dynamic> json) => DialerApi(
        member: Member.fromJson(json["member"]),
        data: Data.fromJson(json["data"]),
        totNotification: List<PreferenceNotificationList>.from(json["tot_notification"].map((x) => PreferenceNotificationList.fromJson(x))),
        preferenceNotificationList: List<PreferenceNotificationList>.from(json["preference_notification_list"].map((x) => PreferenceNotificationList.fromJson(x))),
        followupList: List<FollowupList>.from(json["followup_list"].map((x) => FollowupList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "member": member.toJson(),
        "data": data.toJson(),
        "tot_notification": List<dynamic>.from(totNotification.map((x) => x.toJson())),
        "preference_notification_list": List<dynamic>.from(preferenceNotificationList.map((x) => x.toJson())),
        "followup_list": List<dynamic>.from(followupList.map((x) => x.toJson())),
    };
}

class Data {
    List<dynamic> today;
    List<dynamic> yesterday;
    List<dynamic> tomorrow;
    List<FollowupList> total;
    int todayPending;
    CallyzerPhone todayCallyzerPhone;
    CallyzerPhone yesterdayCallyzerPhone;
    CallyzerPhone lastweekCallyzerPhone;
    Map<String, int> memberStatusValues;
    int totalMonthSale;
    int currentMonthSale;
    int lastMonthSale;

    Data({
        required this.today,
        required this.yesterday,
        required this.tomorrow,
        required this.total,
        required this.todayPending,
        required this.todayCallyzerPhone,
        required this.yesterdayCallyzerPhone,
        required this.lastweekCallyzerPhone,
        required this.memberStatusValues,
        required this.totalMonthSale,
        required this.currentMonthSale,
        required this.lastMonthSale,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        today: List<dynamic>.from(json["today"].map((x) => x)),
        yesterday: List<dynamic>.from(json["yesterday"].map((x) => x)),
        tomorrow: List<dynamic>.from(json["tomorrow"].map((x) => x)),
        total: List<FollowupList>.from(json["total"].map((x) => FollowupList.fromJson(x))),
        todayPending: json["today_pending"],
        todayCallyzerPhone: CallyzerPhone.fromJson(json["today_callyzer_phone"]),
        yesterdayCallyzerPhone: CallyzerPhone.fromJson(json["yesterday_callyzer_phone"]),
        lastweekCallyzerPhone: CallyzerPhone.fromJson(json["lastweek_callyzer_phone"]),
        memberStatusValues: Map.from(json["member_status_values"]).map((k, v) => MapEntry<String, int>(k, v)),
        totalMonthSale: json["total_month_sale"],
        currentMonthSale: json["current_month_sale"],
        lastMonthSale: json["last_month_sale"],
    );

    Map<String, dynamic> toJson() => {
        "today": List<dynamic>.from(today.map((x) => x)),
        "yesterday": List<dynamic>.from(yesterday.map((x) => x)),
        "tomorrow": List<dynamic>.from(tomorrow.map((x) => x)),
        "total": List<dynamic>.from(total.map((x) => x.toJson())),
        "today_pending": todayPending,
        "today_callyzer_phone": todayCallyzerPhone.toJson(),
        "yesterday_callyzer_phone": yesterdayCallyzerPhone.toJson(),
        "lastweek_callyzer_phone": lastweekCallyzerPhone.toJson(),
        "member_status_values": Map.from(memberStatusValues).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "total_month_sale": totalMonthSale,
        "current_month_sale": currentMonthSale,
        "last_month_sale": lastMonthSale,
    };
}

class CallyzerPhone {
    int totalIncomingCalls;
    int totalIncomingDuration;
    int totalOutgoingCalls;
    int totalOutgoingDuration;
    int totalMissedCalls;
    int totalRejectedCalls;
    int totalCalls;
    int totalDuration;
    int totalNeverAttendedCalls;
    int totalNotPickupByClientsCalls;
    int totalUniqueClients;
    String? totalWorkingHours;
    int totalConnectedCalls;

    CallyzerPhone({
        required this.totalIncomingCalls,
        required this.totalIncomingDuration,
        required this.totalOutgoingCalls,
        required this.totalOutgoingDuration,
        required this.totalMissedCalls,
        required this.totalRejectedCalls,
        required this.totalCalls,
        required this.totalDuration,
        required this.totalNeverAttendedCalls,
        required this.totalNotPickupByClientsCalls,
        required this.totalUniqueClients,
        required this.totalWorkingHours,
        required this.totalConnectedCalls,
    });

    factory CallyzerPhone.fromJson(Map<String, dynamic> json) => CallyzerPhone(
        totalIncomingCalls: json["total_incoming_calls"],
        totalIncomingDuration: json["total_incoming_duration"],
        totalOutgoingCalls: json["total_outgoing_calls"],
        totalOutgoingDuration: json["total_outgoing_duration"],
        totalMissedCalls: json["total_missed_calls"],
        totalRejectedCalls: json["total_rejected_calls"],
        totalCalls: json["total_calls"],
        totalDuration: json["total_duration"],
        totalNeverAttendedCalls: json["total_never_attended_calls"],
        totalNotPickupByClientsCalls: json["total_not_pickup_by_clients_calls"],
        totalUniqueClients: json["total_unique_clients"],
        totalWorkingHours: json["total_working_hours"],
        totalConnectedCalls: json["total_connected_calls"],
    );

    Map<String, dynamic> toJson() => {
        "total_incoming_calls": totalIncomingCalls,
        "total_incoming_duration": totalIncomingDuration,
        "total_outgoing_calls": totalOutgoingCalls,
        "total_outgoing_duration": totalOutgoingDuration,
        "total_missed_calls": totalMissedCalls,
        "total_rejected_calls": totalRejectedCalls,
        "total_calls": totalCalls,
        "total_duration": totalDuration,
        "total_never_attended_calls": totalNeverAttendedCalls,
        "total_not_pickup_by_clients_calls": totalNotPickupByClientsCalls,
        "total_unique_clients": totalUniqueClients,
        "total_working_hours": totalWorkingHours,
        "total_connected_calls": totalConnectedCalls,
    };
}

class FollowupList {
    int id;
    int staffId;
    int userId;
    DateTime? nextFollowUp;
    String comment;
    int memberStatus;
    DateTime createdAt;
    DateTime updatedAt;

    FollowupList({
        required this.id,
        required this.staffId,
        required this.userId,
        required this.nextFollowUp,
        required this.comment,
        required this.memberStatus,
        required this.createdAt,
        required this.updatedAt,
    });

    factory FollowupList.fromJson(Map<String, dynamic> json) => FollowupList(
        id: json["id"],
        staffId: json["staff_id"],
        userId: json["user_id"],
        nextFollowUp: json["next_follow_up"] == null ? null : DateTime.parse(json["next_follow_up"]),
        comment: json["comment"],
        memberStatus: json["member_status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "staff_id": staffId,
        "user_id": userId,
        "next_follow_up": nextFollowUp?.toIso8601String(),
        "comment": comment,
        "member_status": memberStatus,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Member {
    int id;
    String userType;
    dynamic referredBy;
    dynamic roleId;
    dynamic code;
    int membership;
    int profilePrivacy;
    String firstName;
    String lastName;
    dynamic name;
    String email;
    DateTime emailVerifiedAt;
    dynamic newEmailVerificiationCode;
    String phone;
    dynamic verificationCode;
    dynamic providerId;
    dynamic fcmToken;
    dynamic photo;
    int photoApproved;
    dynamic lastLoginIp;
    DateTime lastLoginAt;
    int blocked;
    int deactivated;
    int permanentlyDelete;
    int approved;
    dynamic verificationInfo;
    int balance;
    int referralComission;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic deletedAt;
    dynamic adhaarFront;
    dynamic adhaarBack;
    dynamic adharNumber;
    int adharApprooved;
    int callyzerEmpId;
    int partnerExpectationsAdded;
    int anualIncome;
    dynamic manglik;
    dynamic food;
    dynamic countries;
    dynamic states;
    dynamic educations;
    dynamic profession;
    dynamic working;

    Member({
        required this.id,
        required this.userType,
        required this.referredBy,
        required this.roleId,
        required this.code,
        required this.membership,
        required this.profilePrivacy,
        required this.firstName,
        required this.lastName,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.newEmailVerificiationCode,
        required this.phone,
        required this.verificationCode,
        required this.providerId,
        required this.fcmToken,
        required this.photo,
        required this.photoApproved,
        required this.lastLoginIp,
        required this.lastLoginAt,
        required this.blocked,
        required this.deactivated,
        required this.permanentlyDelete,
        required this.approved,
        required this.verificationInfo,
        required this.balance,
        required this.referralComission,
        required this.createdAt,
        required this.updatedAt,
        required this.deletedAt,
        required this.adhaarFront,
        required this.adhaarBack,
        required this.adharNumber,
        required this.adharApprooved,
        required this.callyzerEmpId,
        required this.partnerExpectationsAdded,
        required this.anualIncome,
        required this.manglik,
        required this.food,
        required this.countries,
        required this.states,
        required this.educations,
        required this.profession,
        required this.working,
    });

    factory Member.fromJson(Map<String, dynamic> json) => Member(
        id: json["id"],
        userType: json["user_type"],
        referredBy: json["referred_by"],
        roleId: json["role_id"],
        code: json["code"],
        membership: json["membership"],
        profilePrivacy: json["profile_privacy"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: DateTime.parse(json["email_verified_at"]),
        newEmailVerificiationCode: json["new_email_verificiation_code"],
        phone: json["phone"],
        verificationCode: json["verification_code"],
        providerId: json["provider_id"],
        fcmToken: json["fcm_token"],
        photo: json["photo"],
        photoApproved: json["photo_approved"],
        lastLoginIp: json["last_login_ip"],
        lastLoginAt: DateTime.parse(json["last_login_at"]),
        blocked: json["blocked"],
        deactivated: json["deactivated"],
        permanentlyDelete: json["permanently_delete"],
        approved: json["approved"],
        verificationInfo: json["verification_info"],
        balance: json["balance"],
        referralComission: json["referral_comission"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
        adhaarFront: json["adhaar_front"],
        adhaarBack: json["adhaar_back"],
        adharNumber: json["adhar_number"],
        adharApprooved: json["adhar_approoved"],
        callyzerEmpId: json["callyzer_emp_id"],
        partnerExpectationsAdded: json["partner_expectations_added"],
        anualIncome: json["anual_income"],
        manglik: json["manglik"],
        food: json["food"],
        countries: json["countries"],
        states: json["states"],
        educations: json["educations"],
        profession: json["profession"],
        working: json["working"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_type": userType,
        "referred_by": referredBy,
        "role_id": roleId,
        "code": code,
        "membership": membership,
        "profile_privacy": profilePrivacy,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt.toIso8601String(),
        "new_email_verificiation_code": newEmailVerificiationCode,
        "phone": phone,
        "verification_code": verificationCode,
        "provider_id": providerId,
        "fcm_token": fcmToken,
        "photo": photo,
        "photo_approved": photoApproved,
        "last_login_ip": lastLoginIp,
        "last_login_at": lastLoginAt.toIso8601String(),
        "blocked": blocked,
        "deactivated": deactivated,
        "permanently_delete": permanentlyDelete,
        "approved": approved,
        "verification_info": verificationInfo,
        "balance": balance,
        "referral_comission": referralComission,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
        "adhaar_front": adhaarFront,
        "adhaar_back": adhaarBack,
        "adhar_number": adharNumber,
        "adhar_approoved": adharApprooved,
        "callyzer_emp_id": callyzerEmpId,
        "partner_expectations_added": partnerExpectationsAdded,
        "anual_income": anualIncome,
        "manglik": manglik,
        "food": food,
        "countries": countries,
        "states": states,
        "educations": educations,
        "profession": profession,
        "working": working,
    };
}

class PreferenceNotificationList {
    int id;
    int userId;
    int preferenceUserId;
    int staffId;
    DateTime createdAt;
    DateTime updatedAt;
    dynamic userDetails;

    PreferenceNotificationList({
        required this.id,
        required this.userId,
        required this.preferenceUserId,
        required this.staffId,
        required this.createdAt,
        required this.updatedAt,
        this.userDetails,
    });

    factory PreferenceNotificationList.fromJson(Map<String, dynamic> json) => PreferenceNotificationList(
        id: json["id"],
        userId: json["user_id"],
        preferenceUserId: json["preference_user_id"],
        staffId: json["staff_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        userDetails: json["user_details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "preference_user_id": preferenceUserId,
        "staff_id": staffId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "user_details": userDetails,
    };
}
