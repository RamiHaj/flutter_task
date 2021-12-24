class LoginModel
{
  String? userName;
  String? password;

  LoginModel(
      this.password,
      this.userName
      );

  LoginModel.fromjson(Map<String , dynamic>json)
  {
    userName = json['userName'];
    password = json['password'];
  }
}