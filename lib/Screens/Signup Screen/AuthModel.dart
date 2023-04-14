import 'Data.dart';

class AuthModel {
  AuthModel({
      this.status, 
      this.data, 
      this.token,});

  AuthModel.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }
  bool? status;
  Data? data;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['token'] = token;
    return map;
  }

}


class Data {
  Data({
    this.name,
    this.email,
    this.mobile,
    this.otp,
    this.updatedAt,
    this.createdAt,
    this.id,});

  Data.fromJson(dynamic json) {
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    otp = json['otp'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }
  String? name;
  String? email;
  String? mobile;
  int? otp;
  String? updatedAt;
  String? createdAt;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['mobile'] = mobile;
    map['otp'] = otp;
    map['updated_at'] = updatedAt;
    map['created_at'] = createdAt;
    map['id'] = id;
    return map;
  }

}
