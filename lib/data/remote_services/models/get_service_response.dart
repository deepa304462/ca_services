/// status : true
/// message : "Fetch Successfully..."
/// data : [{"id":"1","service_name":"Home Loan","description":"SBI Home Loans offers a one stop solution to a home buyer. You can browse through our range of home loan products, check your eligibility and apply online!","icon":"https://api.pm-kisan-status.com/repito/uploads/service/real-estate.png","addon":"2023-11-23 22:32:48"},{"id":"2","service_name":"Car Loan","description":"SBI Home Loans offers a one stop solution to a home buyer. You can browse through our range of home loan products, check your eligibility and apply online!","icon":"https://api.pm-kisan-status.com/repito/uploads/service/car-loan.png","addon":"2023-11-23 22:33:06"}]

class GetServiceResponse {
  GetServiceResponse({
      bool? status, 
      String? message, 
      List<Data>? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetServiceResponse.fromJson(dynamic json) {
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
GetServiceResponse copyWith({  bool? status,
  String? message,
  List<Data>? data,
}) => GetServiceResponse(  status: status ?? _status,
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
/// service_name : "Home Loan"
/// description : "SBI Home Loans offers a one stop solution to a home buyer. You can browse through our range of home loan products, check your eligibility and apply online!"
/// icon : "https://api.pm-kisan-status.com/repito/uploads/service/real-estate.png"
/// addon : "2023-11-23 22:32:48"

class Data {
  Data({
      String? id, 
      String? serviceName, 
      String? description, 
      String? icon, 
      String? addon,}){
    _id = id;
    _serviceName = serviceName;
    _description = description;
    _icon = icon;
    _addon = addon;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _serviceName = json['service_name'];
    _description = json['description'];
    _icon = json['icon'];
    _addon = json['addon'];
  }
  String? _id;
  String? _serviceName;
  String? _description;
  String? _icon;
  String? _addon;
Data copyWith({  String? id,
  String? serviceName,
  String? description,
  String? icon,
  String? addon,
}) => Data(  id: id ?? _id,
  serviceName: serviceName ?? _serviceName,
  description: description ?? _description,
  icon: icon ?? _icon,
  addon: addon ?? _addon,
);
  String? get id => _id;
  String? get serviceName => _serviceName;
  String? get description => _description;
  String? get icon => _icon;
  String? get addon => _addon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['service_name'] = _serviceName;
    map['description'] = _description;
    map['icon'] = _icon;
    map['addon'] = _addon;
    return map;
  }

}