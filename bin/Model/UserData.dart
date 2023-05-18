class UserData {
  String? email;
  String? password;

  UserData({
    this.email,
    this.password,
  });

  factory UserData.fromJson(Map json) {
    return UserData(
      email: json["Email"],
      password: json["password"],
    );
  }

  toMap() {
    return {
      "Email": email,
      "password": password,
    };
  }
}
