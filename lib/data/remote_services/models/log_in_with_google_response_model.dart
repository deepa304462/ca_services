/// status : true
/// message : "Login Successfully..."
/// data : {"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ1c2VyIjoiVm14a01GSXhUWGRsUm1SWVlURndWMWxZY0VkUk1WSllXWHBzVVZWVU1Eaz0iLCJ1c2VybmFtZSI6IlJhaiAiLCJpYXQiOjE3MDAyMzU2NjUsImV4cCI6MTcwMjgyNzY2NX0.PQgI8xTzHvxhozdtgvgPJOnFFzblsouotW-IAsqqomwsUmNAP80ylLwfJSCPfPnG--RhCugAAsiPcD2btc8NYTubncuYND3Dy-OTcWvKLsbajpI52cZPPiofXdE_ChX16dwwsuvjDSczL-BSoU4GooWvPO8dOnkylDP7A5qsgBI","name":"Raj "}

class LogInWithGoogleResponseModel {
  LogInWithGoogleResponseModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LogInWithGoogleResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LogInWithGoogleResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => LogInWithGoogleResponseModel(  status: status ?? _status,
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

/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJ1c2VyIjoiVm14a01GSXhUWGRsUm1SWVlURndWMWxZY0VkUk1WSllXWHBzVVZWVU1Eaz0iLCJ1c2VybmFtZSI6IlJhaiAiLCJpYXQiOjE3MDAyMzU2NjUsImV4cCI6MTcwMjgyNzY2NX0.PQgI8xTzHvxhozdtgvgPJOnFFzblsouotW-IAsqqomwsUmNAP80ylLwfJSCPfPnG--RhCugAAsiPcD2btc8NYTubncuYND3Dy-OTcWvKLsbajpI52cZPPiofXdE_ChX16dwwsuvjDSczL-BSoU4GooWvPO8dOnkylDP7A5qsgBI"
/// name : "Raj "

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