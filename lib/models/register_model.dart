class RegisterModel {
  String? name;
  String? surname;
  String? userName;
  String? email;
  String? password;

  RegisterModel(
      {this.name, this.surname, this.userName, this.email, this.password});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    surname = json['surname'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['surname'] = this.surname;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}