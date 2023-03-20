class ProfileModel{
  String? name;
  String? email;
  String? mobile;
  ProfileModel(
      {this.name,
        this.email,
        this.mobile
        });
  ProfileModel.fromJson(Map<String, dynamic> json) {
    name= json['name'];
    email = json['email'];
    mobile = json['mobile'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile '] = this.mobile;
    return data;
  }
}

