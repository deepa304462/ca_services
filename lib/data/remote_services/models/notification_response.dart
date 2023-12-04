/// status : true
/// message : "fetch successfully..."
/// data : [{"id":"1","title":"Title","message":"Message Here","data":"Data Here","addon":"2023-12-01 12:00:00","update_on":null}]

class NotificationResponse {
  NotificationResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  NotificationResponse.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _status;
  String? _message;
  List<Data>? _data;
NotificationResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => NotificationResponse(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "1"
/// title : "Title"
/// message : "Message Here"
/// data : "Data Here"
/// addon : "2023-12-01 12:00:00"
/// update_on : null

class Data {
  Data({
      String? id, 
      String? title, 
      String? message, 
      String? data, 
      String? addon, 
      dynamic updateOn,}){
    _id = id;
    _title = title;
    _message = message;
    _data = data;
    _addon = addon;
    _updateOn = updateOn;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _message = json['message'];
    _data = json['data'];
    _addon = json['addon'];
    _updateOn = json['update_on'];
  }
  String? _id;
  String? _title;
  String? _message;
  String? _data;
  String? _addon;
  dynamic _updateOn;
Data copyWith({  String? id,
  String? title,
  String? message,
  String? data,
  String? addon,
  dynamic updateOn,
}) => Data(  id: id ?? _id,
  title: title ?? _title,
  message: message ?? _message,
  data: data ?? _data,
  addon: addon ?? _addon,
  updateOn: updateOn ?? _updateOn,
);
  String? get id => _id;
  String? get title => _title;
  String? get message => _message;
  String? get data => _data;
  String? get addon => _addon;
  dynamic get updateOn => _updateOn;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['message'] = _message;
    map['data'] = _data;
    map['addon'] = _addon;
    map['update_on'] = _updateOn;
    return map;
  }

}