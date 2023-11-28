/// email : "david.raj@gmail.com"
/// auth_id : "1234567890"
/// auth_from : "facebook"
/// name : "Raj"
/// profile_pic : ""

class LogInWithGoogleRequestModel {
  LogInWithGoogleRequestModel({
      String? email, 
      String? authId, 
      String? authFrom, 
      String? name, 
      String? profilePic,}){
    _email = email;
    _authId = authId;
    _authFrom = authFrom;
    _name = name;
    _profilePic = profilePic;
}

  LogInWithGoogleRequestModel.fromJson(dynamic json) {
    _email = json['email'];
    _authId = json['auth_id'];
    _authFrom = json['auth_from'];
    _name = json['name'];
    _profilePic = json['profile_pic'];
  }
  String? _email;
  String? _authId;
  String? _authFrom;
  String? _name;
  String? _profilePic;
LogInWithGoogleRequestModel copyWith({  String? email,
  String? authId,
  String? authFrom,
  String? name,
  String? profilePic,
}) => LogInWithGoogleRequestModel(  email: email ?? _email,
  authId: authId ?? _authId,
  authFrom: authFrom ?? _authFrom,
  name: name ?? _name,
  profilePic: profilePic ?? _profilePic,
);
  String? get email => _email;
  String? get authId => _authId;
  String? get authFrom => _authFrom;
  String? get name => _name;
  String? get profilePic => _profilePic;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['auth_id'] = _authId;
    map['auth_from'] = _authFrom;
    map['name'] = _name;
    map['profile_pic'] = _profilePic;
    return map;
  }

}