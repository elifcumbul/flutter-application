class LoginModel {
  String? userNameOrMail;
  String? password;

  LoginModel({this.userNameOrMail, this.password});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userNameOrMail = json['userNameOrMail'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userNameOrMail'] = this.userNameOrMail;
    data['password'] = this.password;
    return data;
  }
}