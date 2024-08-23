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
  String? avatarFileName;
  String? coverFileName;
  String? resumeFileName;
  String? aboutMe;
  String? fullName;
  String? role;
  String? dateOfBirth;
  String? phoneNumber;
  String? gender;
  String? typeNotificationAccept;
  String? address;
  Company? company;

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
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
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
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? description;
  Null? logo;
  Null? availableJobs;
  List<Industries>? industries;

  Company(
      {this.id,
      this.name,
      this.description,
      this.logo,
      this.availableJobs,
      this.industries});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    logo = json['logo'];
    availableJobs = json['availableJobs'];
    if (json['industries'] != null) {
      industries = <Industries>[];
      json['industries'].forEach((v) {
        industries!.add(new Industries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['logo'] = this.logo;
    data['availableJobs'] = this.availableJobs;
    if (this.industries != null) {
      data['industries'] = this.industries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Industries {
  int? id;
  String? name;

  Industries({this.id, this.name});

  Industries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
