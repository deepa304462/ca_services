/// status : true
/// message : "Login Successfully..."
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ1c2VyIjoiVm14a01GSXhUWGRsUm1SWVlURndWMWxZY0VkUk1WSlhVbFJzVVZWVU1Eaz0iLCJ1c2VybmFtZSI6InZhaWJoYXYgdmFpYmhhdiIsImlhdCI6MTcwMDIzMTM5NSwiZXhwIjoxNzAyODIzMzk1fQ.OmcOgEdD-VAMcOkJMJqyxR9ONJHMVTVs6Axxq6GfcffwB47coNZEdTJxAr2SjzVLuHNc6fwt80l-mcdI1R4A4GnyC8mh0xQ_-r5xJXsg8JEWvVv5oPgTscQXpilwCV7bZySBH--P7evHqfDNz54qwvn6mtxXSu0fcC85I5nCuxM","name":"vaibhav vaibhav"}

class SignInResponseModel {
  SignInResponseModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  SignInResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
SignInResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => SignInResponseModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ1c2VyIjoiVm14a01GSXhUWGRsUm1SWVlURndWMWxZY0VkUk1WSlhVbFJzVVZWVU1Eaz0iLCJ1c2VybmFtZSI6InZhaWJoYXYgdmFpYmhhdiIsImlhdCI6MTcwMDIzMTM5NSwiZXhwIjoxNzAyODIzMzk1fQ.OmcOgEdD-VAMcOkJMJqyxR9ONJHMVTVs6Axxq6GfcffwB47coNZEdTJxAr2SjzVLuHNc6fwt80l-mcdI1R4A4GnyC8mh0xQ_-r5xJXsg8JEWvVv5oPgTscQXpilwCV7bZySBH--P7evHqfDNz54qwvn6mtxXSu0fcC85I5nCuxM"
/// name : "vaibhav vaibhav"

class Data {
  Data({
      String? token, 
      String? name,}){
    _token = token;
    _name = name;
}

  Data.fromJson(dynamic json) {
    _token = json['token'];
    _name = json['name'];
  }
  String? _token;
  String? _name;
Data copyWith({  String? token,
  String? name,
}) => Data(  token: token ?? _token,
  name: name ?? _name,
);
  String? get token => _token;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = _token;
    map['name'] = _name;
    return map;
  }

}