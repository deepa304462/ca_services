/// mobile : "7988492359"
/// password : "123456"

class SignInRequestModel {
  SignInRequestModel({
      String? mobile, 
      String? password,}){
    _mobile = mobile;
    _password = password;
}

  set mobile(String? value) {
    _mobile = value;
  }

  SignInRequestModel.fromJson(dynamic json) {
    _mobile = json['mobile'];
    _password = json['password'];
  }
  String? _mobile;
  String? _password;
SignInRequestModel copyWith({  String? mobile,
  String? password,
}) => SignInRequestModel(  mobile: mobile ?? _mobile,
  password: password ?? _password,
);
  String? get mobile => _mobile;
  String? get password => _password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['mobile'] = _mobile;
    map['password'] = _password;
    return map;
  }

  set password(String? value) {
    _password = value;
  }
}