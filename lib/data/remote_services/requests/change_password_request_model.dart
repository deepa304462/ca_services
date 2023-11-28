/// old_password : "12345678"
/// new_password : "123456"
/// confirm_password : "123456"

class ChangePasswordRequestModel {
  ChangePasswordRequestModel({
      String? oldPassword, 
      String? newPassword, 
      String? confirmPassword,}){
    _oldPassword = oldPassword;
    _newPassword = newPassword;
    _confirmPassword = confirmPassword;
}

  ChangePasswordRequestModel.fromJson(dynamic json) {
    _oldPassword = json['old_password'];
    _newPassword = json['new_password'];
    _confirmPassword = json['confirm_password'];
  }

  set oldPassword(String? value) {
    _oldPassword = value;
  }

  String? _oldPassword;
  String? _newPassword;
  String? _confirmPassword;
ChangePasswordRequestModel copyWith({  String? oldPassword,
  String? newPassword,
  String? confirmPassword,
}) => ChangePasswordRequestModel(  oldPassword: oldPassword ?? _oldPassword,
  newPassword: newPassword ?? _newPassword,
  confirmPassword: confirmPassword ?? _confirmPassword,
);
  String? get oldPassword => _oldPassword;
  String? get newPassword => _newPassword;
  String? get confirmPassword => _confirmPassword;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['old_password'] = _oldPassword;
    map['new_password'] = _newPassword;
    map['confirm_password'] = _confirmPassword;
    return map;
  }

  set newPassword(String? value) {
    _newPassword = value;
  }

  set confirmPassword(String? value) {
    _confirmPassword = value;
  }
}