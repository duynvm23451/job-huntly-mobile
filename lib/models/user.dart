class User {
  bool? success;
  String? message;
  Null? code;
  Data? data;

  User({this.success, this.message, this.code, this.data});

  User.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? username;
  String? email;
  Null? avatarFileName;
  Null? coverFileName;
  Null? resumeFileName;
  Null? aboutMe;
  String? fullName;
  String? role;
  Null? dateOfBirth;
  Null? phoneNumber;
  Null? gender;
  Null? typeNotificationAccept;
  Null? address;
  Null? company;

  Data(
      {this.id,
      this.username,
      this.email,
      this.avatarFileName,
      this.coverFileName,
      this.resumeFileName,
      this.aboutMe,
      this.fullName,
      this.role,
      this.dateOfBirth,
      this.phoneNumber,
      this.gender,
      this.typeNotificationAccept,
      this.address,
      this.company});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    email = json['email'];
    avatarFileName = json['avatarFileName'];
    coverFileName = json['coverFileName'];
    resumeFileName = json['resumeFileName'];
    aboutMe = json['aboutMe'];
    fullName = json['fullName'];
    role = json['role'];
    dateOfBirth = json['dateOfBirth'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    typeNotificationAccept = json['typeNotificationAccept'];
    address = json['address'];
    company = json['company'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['email'] = this.email;
    data['avatarFileName'] = this.avatarFileName;
    data['coverFileName'] = this.coverFileName;
    data['resumeFileName'] = this.resumeFileName;
    data['aboutMe'] = this.aboutMe;
    data['fullName'] = this.fullName;
    data['role'] = this.role;
    data['dateOfBirth'] = this.dateOfBirth;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['typeNotificationAccept'] = this.typeNotificationAccept;
    data['address'] = this.address;
    data['company'] = this.company;
    return data;
  }
}
