class RegisterModel {

  String? userName;
  String? password;
  String? fullName;
  String? phoneNumber;
  String? city;

  RegisterModel({
    this.userName,
    this.password,
    this.fullName,
    this.phoneNumber,
    this.city,
  });
  RegisterModel.fromJson(Map<String, dynamic>? json) {
    userName = json!['userName']?.toString();
    password = json['password']?.toString();
    fullName = json['fullName']?.toString();
    phoneNumber = json['phoneNumber']?.toString();
    city = json['city']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userName'] = userName;
    data['password'] = password;
    data['fullName'] = fullName;
    data['phoneNumber'] = phoneNumber;
    data['city'] = city;
    return data;
  }
}
