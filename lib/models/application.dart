import 'package:job_huntly_mobile/models/user.dart';

class Application {
  bool? success;
  String? message;
  int? code;
  Data? data;

  Application({this.success, this.message, this.code, this.data});

  Application.fromJson(Map<String, dynamic> json) {
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
  List<Content>? content;
  Page? page;

  Data({this.content, this.page});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['content'] != null) {
      content = <Content>[];
      json['content'].forEach((v) {
        content!.add(new Content.fromJson(v));
      });
    }
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.content != null) {
      data['content'] = this.content!.map((v) => v.toJson()).toList();
    }
    if (this.page != null) {
      data['page'] = this.page!.toJson();
    }
    return data;
  }
}

class Content {
  int? id;
  User? user;
  Job? job;
  String? status;
  String? interviewTime;
  String? createdAt;

  Content(
      {this.id,
      this.user,
      this.job,
      this.status,
      this.interviewTime,
      this.createdAt});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    job = json['job'] != null ? new Job.fromJson(json['job']) : null;
    status = json['status'];
    interviewTime = json['interviewTime'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.job != null) {
      data['job'] = this.job!.toJson();
    }
    data['status'] = this.status;
    data['interviewTime'] = this.interviewTime;
    data['createdAt'] = this.createdAt;
    return data;
  }
}

class Job {
  int? id;
  String? title;
  String? description;
  String? type;
  int? minSalary;
  int? maxSalary;
  String? responsibilities;
  String? niceToHaves;
  String? preferredQualifications;
  Null? perkAndBenefits;
  int? numberOfRecruits;
  String? jobLevel;
  String? createdAt;
  String? updatedAt;
  String? deadline;
  List<String>? categories;
  Company? company;
  int? numberOfHired;

  Job(
      {this.id,
      this.title,
      this.description,
      this.type,
      this.minSalary,
      this.maxSalary,
      this.responsibilities,
      this.niceToHaves,
      this.preferredQualifications,
      this.perkAndBenefits,
      this.numberOfRecruits,
      this.jobLevel,
      this.createdAt,
      this.updatedAt,
      this.deadline,
      this.categories,
      this.company,
      this.numberOfHired});

  Job.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    type = json['type'];
    minSalary = json['minSalary'];
    maxSalary = json['maxSalary'];
    responsibilities = json['responsibilities'];
    niceToHaves = json['niceToHaves'];
    preferredQualifications = json['preferredQualifications'];
    perkAndBenefits = json['perkAndBenefits'];
    numberOfRecruits = json['numberOfRecruits'];
    jobLevel = json['jobLevel'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deadline = json['deadline'];
    categories = json['categories'].cast<String>();
    company =
        json['company'] != null ? new Company.fromJson(json['company']) : null;
    numberOfHired = json['numberOfHired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['type'] = this.type;
    data['minSalary'] = this.minSalary;
    data['maxSalary'] = this.maxSalary;
    data['responsibilities'] = this.responsibilities;
    data['niceToHaves'] = this.niceToHaves;
    data['preferredQualifications'] = this.preferredQualifications;
    data['perkAndBenefits'] = this.perkAndBenefits;
    data['numberOfRecruits'] = this.numberOfRecruits;
    data['jobLevel'] = this.jobLevel;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['deadline'] = this.deadline;
    data['categories'] = this.categories;
    if (this.company != null) {
      data['company'] = this.company!.toJson();
    }
    data['numberOfHired'] = this.numberOfHired;
    return data;
  }
}

class Company {
  int? id;
  String? name;
  String? logo;
  String? location;
  int? employees;

  Company({this.id, this.name, this.logo, this.location, this.employees});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    location = json['location'];
    employees = json['employees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['location'] = this.location;
    data['employees'] = this.employees;
    return data;
  }
}

class Page {
  int? size;
  int? number;
  int? totalElements;
  int? totalPages;

  Page({this.size, this.number, this.totalElements, this.totalPages});

  Page.fromJson(Map<String, dynamic> json) {
    size = json['size'];
    number = json['number'];
    totalElements = json['totalElements'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['size'] = this.size;
    data['number'] = this.number;
    data['totalElements'] = this.totalElements;
    data['totalPages'] = this.totalPages;
    return data;
  }
}
