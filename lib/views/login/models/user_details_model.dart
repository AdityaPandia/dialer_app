// // To parse this JSON data, do
// //
// //     final userDetails = userDetailsFromJson(jsonString);

// import 'dart:convert';

// UserDetails userDetailsFromJson(String str) => UserDetails.fromJson(json.decode(str));

// String userDetailsToJson(UserDetails data) => json.encode(data.toJson());

// class UserDetails {
//     bool result;
//     Data data;

//     UserDetails({
//         required this.result,
//         required this.data,
//     });

//     factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
//         result: json["result"],
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "result": result,
//         "data": data.toJson(),
//     };
// }

// class Data {
  
//     BasicInfo basicInfo;
   

//     Data({
//       required this.basicInfo,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
        
//         basicInfo: BasicInfo.fromJson(json["basic_info"]),
      
//     );

//     Map<String, dynamic> toJson() => {
        
//         "basic_info": basicInfo.toJson(),
       
//     };
// }

// class BasicInfo {
//     String firsName;
//     String lastName;
//    int ? memberStatus;
//     String phone;

//     String photo;

//     BasicInfo({
//         required this.firsName,
//         required this.lastName,
//       this.memberStatus,
//         required this.phone,
      
//         required this.photo,
//     });

//     factory BasicInfo.fromJson(Map<String, dynamic> json) => BasicInfo(
//         firsName: json["firs_name"],
//         lastName: json["last_name"],
//       phone: json["phone"],
//         photo: json["photo"],
//     );

//     Map<String, dynamic> toJson() => {
//         "firs_name": firsName,
//         "last_name": lastName,
 
//         "phone": phone,
    
//         "photo": photo,
//     };
// }
