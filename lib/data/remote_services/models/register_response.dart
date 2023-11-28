/// status : true
/// message : "Account Created Successfully.."
/// data : ""

class UserRegisterResponseModel {
  UserRegisterResponseModel({
      bool? status, 
      String? message, 
      String? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  UserRegisterResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'];
  }
  bool? _status;
  String? _message;
  String? _data;
UserRegisterResponseModel copyWith({  bool? status,
  String? message,
  String? data,
}) => UserRegisterResponseModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  String? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}