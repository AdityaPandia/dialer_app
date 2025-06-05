// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'dart:convert';

UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

class UserDetails {
    bool result;
    Data data;

    UserDetails({
        required this.result,
        required this.data,
    });

    factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        result: json["result"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "result": result,
        "data": data.toJson(),
    };
}

class Data {
    Intoduction intoduction;
    BasicInfo basicInfo;
    bool profilePicRequest;
    PresentAddress presentAddress;
    ContactDetails contactDetails;
    List<dynamic> education;
    List<dynamic> career;
    PhysicalAttributes physicalAttributes;
    List<dynamic> knownLanguages;
    MotherTongue motherTongue;
    String hobbiesInterest;
    String attitudeBehavior;
    String residenceInfo;
    SpiritualBackgrounds spiritualBackgrounds;
    String lifestyles;
    String astrologies;
    String permanentAddress;
    String familiesInformation;
    PartnerExpectation partnerExpectation;
    List<dynamic> photoGallery;
    dynamic profileMatch;
    bool viewContactCheck;

    Data({
        required this.intoduction,
        required this.basicInfo,
        required this.profilePicRequest,
        required this.presentAddress,
        required this.contactDetails,
        required this.education,
        required this.career,
        required this.physicalAttributes,
        required this.knownLanguages,
        required this.motherTongue,
        required this.hobbiesInterest,
        required this.attitudeBehavior,
        required this.residenceInfo,
        required this.spiritualBackgrounds,
        required this.lifestyles,
        required this.astrologies,
        required this.permanentAddress,
        required this.familiesInformation,
        required this.partnerExpectation,
        required this.photoGallery,
        required this.profileMatch,
        required this.viewContactCheck,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        intoduction: Intoduction.fromJson(json["intoduction"]),
        basicInfo: BasicInfo.fromJson(json["basic_info"]),
        profilePicRequest: json["profile_pic_request"],
        presentAddress: PresentAddress.fromJson(json["present_address"]),
        contactDetails: ContactDetails.fromJson(json["contact_details"]),
        education: List<dynamic>.from(json["education"].map((x) => x)),
        career: List<dynamic>.from(json["career"].map((x) => x)),
        physicalAttributes: PhysicalAttributes.fromJson(json["physical_attributes"]),
        knownLanguages: List<dynamic>.from(json["known_languages"].map((x) => x)),
        motherTongue: MotherTongue.fromJson(json["mother_tongue"]),
        hobbiesInterest: json["hobbies_interest"],
        attitudeBehavior: json["attitude_behavior"],
        residenceInfo: json["residence_info"],
        spiritualBackgrounds: SpiritualBackgrounds.fromJson(json["spiritual_backgrounds"]),
        lifestyles: json["lifestyles"],
        astrologies: json["astrologies"],
        permanentAddress: json["permanent_address"],
        familiesInformation: json["families_information"],
        partnerExpectation: PartnerExpectation.fromJson(json["partner_expectation"]),
        photoGallery: List<dynamic>.from(json["photo_gallery"].map((x) => x)),
        profileMatch: json["profile_match"],
        viewContactCheck: json["view_contact_check"],
    );

    Map<String, dynamic> toJson() => {
        "intoduction": intoduction.toJson(),
        "basic_info": basicInfo.toJson(),
        "profile_pic_request": profilePicRequest,
        "present_address": presentAddress.toJson(),
        "contact_details": contactDetails.toJson(),
        "education": List<dynamic>.from(education.map((x) => x)),
        "career": List<dynamic>.from(career.map((x) => x)),
        "physical_attributes": physicalAttributes.toJson(),
        "known_languages": List<dynamic>.from(knownLanguages.map((x) => x)),
        "mother_tongue": motherTongue.toJson(),
        "hobbies_interest": hobbiesInterest,
        "attitude_behavior": attitudeBehavior,
        "residence_info": residenceInfo,
        "spiritual_backgrounds": spiritualBackgrounds.toJson(),
        "lifestyles": lifestyles,
        "astrologies": astrologies,
        "permanent_address": permanentAddress,
        "families_information": familiesInformation,
        "partner_expectation": partnerExpectation.toJson(),
        "photo_gallery": List<dynamic>.from(photoGallery.map((x) => x)),
        "profile_match": profileMatch,
        "view_contact_check": viewContactCheck,
    };
}

class BasicInfo {
    String firsName;
    String lastName;
    String code;
    String email;
    int membership;
    int approved;
    int adharApprooved;
    int profilePrivacy;
    int age;
    int walletBalance;
    String myIncome;
    String religion;
    String caste;
    DateTime dateOfBirth;
    String onbehalf;
    String noOfChildren;
    String country;
    String food;
    String manglik;
    String gender;
    String phone;
    String maritialStatus;
    double height;
    String sunSign;
    String moonSign;
    String timeOfBirth;
    String cityOfBirth;
    String photo;

    BasicInfo({
        required this.firsName,
        required this.lastName,
        required this.code,
        required this.email,
        required this.membership,
        required this.approved,
        required this.adharApprooved,
        required this.profilePrivacy,
        required this.age,
        required this.walletBalance,
        required this.myIncome,
        required this.religion,
        required this.caste,
        required this.dateOfBirth,
        required this.onbehalf,
        required this.noOfChildren,
        required this.country,
        required this.food,
        required this.manglik,
        required this.gender,
        required this.phone,
        required this.maritialStatus,
        required this.height,
        required this.sunSign,
        required this.moonSign,
        required this.timeOfBirth,
        required this.cityOfBirth,
        required this.photo,
    });

    factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
        firsName: json["firs_name"],
        lastName: json["last_name"],
        code: json["code"],
        email: json["email"],
        membership: json["membership"],
        approved: json["approved"],
        adharApprooved: json["adhar_approoved"],
        profilePrivacy: json["profile_privacy"],
        age: json["age"],
        walletBalance: json["wallet_balance"],
        myIncome: json["my_income"],
        religion: json["religion"],
        caste: json["caste"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        onbehalf: json["onbehalf"],
        noOfChildren: json["no_of_children"],
        country: json["country"],
        food: json["food"],
        manglik: json["manglik"],
        gender: json["gender"],
        phone: json["phone"],
        maritialStatus: json["maritial_status"],
        height: json["height"]?.toDouble(),
        sunSign: json["sun_sign"],
        moonSign: json["moon_sign"],
        timeOfBirth: json["time_of_birth"],
        cityOfBirth: json["city_of_birth"],
        photo: json["photo"],
    );

    Map<String, dynamic> toJson() => {
        "firs_name": firsName,
        "last_name": lastName,
        "code": code,
        "email": email,
        "membership": membership,
        "approved": approved,
        "adhar_approoved": adharApprooved,
        "profile_privacy": profilePrivacy,
        "age": age,
        "wallet_balance": walletBalance,
        "my_income": myIncome,
        "religion": religion,
        "caste": caste,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "onbehalf": onbehalf,
        "no_of_children": noOfChildren,
        "country": country,
        "food": food,
        "manglik": manglik,
        "gender": gender,
        "phone": phone,
        "maritial_status": maritialStatus,
        "height": height,
        "sun_sign": sunSign,
        "moon_sign": moonSign,
        "time_of_birth": timeOfBirth,
        "city_of_birth": cityOfBirth,
        "photo": photo,
    };
}

class ContactDetails {
    String email;
    String phone;

    ContactDetails({
        required this.email,
        required this.phone,
    });

    factory ContactDetails.fromJson(Map<String, dynamic> json) => ContactDetails(
        email: json["email"],
        phone: json["phone"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "phone": phone,
    };
}

class Intoduction {
    String introduction;

    Intoduction({
        required this.introduction,
    });

    factory Intoduction.fromJson(Map<String, dynamic> json) => Intoduction(
        introduction: json["introduction"],
    );

    Map<String, dynamic> toJson() => {
        "introduction": introduction,
    };
}

class MotherTongue {
    int id;
    String name;

    MotherTongue({
        required this.id,
        required this.name,
    });

    factory MotherTongue.fromJson(Map<String, dynamic> json) => MotherTongue(
        id: json["id"],
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class PartnerExpectation {
    String id;
    String height;
    String maritalStatusId;
    String maritalStatus;
    String religionId;
    String religion;
    String food;
    String heightFrom;
    String heightTo;
    String languageId;
    String language;
    String ageFrom;
    String ageTo;
    String annualIncomeId;
    String annualIncome;
    String countryId;
    String countries;
    String statesId;
    String states;
    String educationId;
    String education;
    String professionId;
    String profession;
    String manglik;
    String age;
    String casteId;
    String caste;

    PartnerExpectation({
        required this.id,
        required this.height,
        required this.maritalStatusId,
        required this.maritalStatus,
        required this.religionId,
        required this.religion,
        required this.food,
        required this.heightFrom,
        required this.heightTo,
        required this.languageId,
        required this.language,
        required this.ageFrom,
        required this.ageTo,
        required this.annualIncomeId,
        required this.annualIncome,
        required this.countryId,
        required this.countries,
        required this.statesId,
        required this.states,
        required this.educationId,
        required this.education,
        required this.professionId,
        required this.profession,
        required this.manglik,
        required this.age,
        required this.casteId,
        required this.caste,
    });

    factory PartnerExpectation.fromJson(Map<String, dynamic> json) => PartnerExpectation(
        id: json["id"],
        height: json["height"],
        maritalStatusId: json["marital_status_id"],
        maritalStatus: json["marital_status"],
        religionId: json["religion_id"],
        religion: json["religion"],
        food: json["food"],
        heightFrom: json["height_from"],
        heightTo: json["height_to"],
        languageId: json["language_id"],
        language: json["language"],
        ageFrom: json["age_from"],
        ageTo: json["age_to"],
        annualIncomeId: json["annual_income_id"],
        annualIncome: json["annual_income"],
        countryId: json["country_id"],
        countries: json["countries"],
        statesId: json["states_id"],
        states: json["states"],
        educationId: json["education_id"],
        education: json["education"],
        professionId: json["profession_id"],
        profession: json["profession"],
        manglik: json["manglik"],
        age: json["age"],
        casteId: json["caste_id"],
        caste: json["caste"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "height": height,
        "marital_status_id": maritalStatusId,
        "marital_status": maritalStatus,
        "religion_id": religionId,
        "religion": religion,
        "food": food,
        "height_from": heightFrom,
        "height_to": heightTo,
        "language_id": languageId,
        "language": language,
        "age_from": ageFrom,
        "age_to": ageTo,
        "annual_income_id": annualIncomeId,
        "annual_income": annualIncome,
        "country_id": countryId,
        "countries": countries,
        "states_id": statesId,
        "states": states,
        "education_id": educationId,
        "education": education,
        "profession_id": professionId,
        "profession": profession,
        "manglik": manglik,
        "age": age,
        "caste_id": casteId,
        "caste": caste,
    };
}

class PhysicalAttributes {
    double height;
    String weight;
    String eyeColor;
    String hairColor;
    String complexion;
    String bloodGroup;
    String bodyType;
    String bodyArt;
    String disability;

    PhysicalAttributes({
        required this.height,
        required this.weight,
        required this.eyeColor,
        required this.hairColor,
        required this.complexion,
        required this.bloodGroup,
        required this.bodyType,
        required this.bodyArt,
        required this.disability,
    });

    factory PhysicalAttributes.fromJson(Map<String, dynamic> json) => PhysicalAttributes(
        height: json["height"]?.toDouble(),
        weight: json["weight"],
        eyeColor: json["eye_color"],
        hairColor: json["hair_color"],
        complexion: json["complexion"],
        bloodGroup: json["blood_group"],
        bodyType: json["body_type"],
        bodyArt: json["body_art"],
        disability: json["disability"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "weight": weight,
        "eye_color": eyeColor,
        "hair_color": hairColor,
        "complexion": complexion,
        "blood_group": bloodGroup,
        "body_type": bodyType,
        "body_art": bodyArt,
        "disability": disability,
    };
}

class PresentAddress {
    String country;
    String state;
    String city;
    String postalCode;

    PresentAddress({
        required this.country,
        required this.state,
        required this.city,
        required this.postalCode,
    });

    factory PresentAddress.fromJson(Map<String, dynamic> json) => PresentAddress(
        country: json["country"],
        state: json["state"],
        city: json["city"],
        postalCode: json["postal_code"],
    );

    Map<String, dynamic> toJson() => {
        "country": country,
        "state": state,
        "city": city,
        "postal_code": postalCode,
    };
}

class SpiritualBackgrounds {
    String religionId;
    String casteId;
    String subCasteId;
    String ethnicity;
    String personalValue;
    String familyValueId;
    String communityValue;

    SpiritualBackgrounds({
        required this.religionId,
        required this.casteId,
        required this.subCasteId,
        required this.ethnicity,
        required this.personalValue,
        required this.familyValueId,
        required this.communityValue,
    });

    factory SpiritualBackgrounds.fromJson(Map<String, dynamic> json) => SpiritualBackgrounds(
        religionId: json["religion_id"],
        casteId: json["caste_id"],
        subCasteId: json["sub_caste_id"],
        ethnicity: json["ethnicity"],
        personalValue: json["personal_value"],
        familyValueId: json["family_value_id"],
        communityValue: json["community_value"],
    );

    Map<String, dynamic> toJson() => {
        "religion_id": religionId,
        "caste_id": casteId,
        "sub_caste_id": subCasteId,
        "ethnicity": ethnicity,
        "personal_value": personalValue,
        "family_value_id": familyValueId,
        "community_value": communityValue,
    };
}
