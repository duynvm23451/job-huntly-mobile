class ApplicationCount {
  bool? success;
  String? message;
  int? code;
  Data? data;

  ApplicationCount({this.success, this.message, this.code, this.data});

  ApplicationCount.fromJson(Map<String, dynamic> json) {
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
  int? interviewing;
  int? total;

  Data({this.interviewing, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    interviewing = json['interviewing'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['interviewing'] = this.interviewing;
    data['total'] = this.total;
    return data;
  }
}
