abstract class LoginStatus{}

class InitialLoginState extends LoginStatus{}

class ChangeIcon extends LoginStatus{}


class SuccessLoginState extends LoginStatus{}
class ErrorLoginState extends LoginStatus{}
class LoadingLoginState extends LoginStatus{}