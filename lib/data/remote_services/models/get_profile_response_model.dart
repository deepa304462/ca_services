/// status : true
/// message : "Fetch Successfully..."
/// data : {"id":"1","mobile":"7988492359","email":"vaibhavpandey123@gmail.com","first_name":"vaibhav","last_name":"vaibhav","gender":"male","profile_pic":null,"address":"Dera Saccha Soda Sirsa","addon":"2023-11-15 22:02:38","city":"57675","state_name":"Haryana","city_name":"Ambala","state_id":"4007","country_id":"101"}

class GetProfileResponseModel {
  GetProfileResponseModel({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  GetProfileResponseModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
GetProfileResponseModel copyWith({  bool? status,
  String? message,
  Data? data,
}) => GetProfileResponseModel(  status: status ?? _status,
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

/// id : "1"
/// mobile : "7988492359"
/// email : "vaibhavpandey123@gmail.com"
/// first_name : "vaibhav"
/// last_name : "vaibhav"
/// gender : "male"
/// profile_pic : null
/// address : "Dera Saccha Soda Sirsa"
/// addon : "2023-11-15 22:02:38"
/// city : "57675"
/// state_name : "Haryana"
/// city_name : "Ambala"
/// state_id : "4007"
/// country_id : "101"

class Data {
  Data({
      String? id, 
      String? mobile, 
      String? email, 
      String? firstName, 
      String? lastName, 
      String? gender, 
      dynamic profilePic, 
      String? address, 
      String? addon, 
      String? city, 
      String? stateName, 
      String? cityName, 
      String? stateId, 
      String? countryId,}){
    _id = id;
    _mobile = mobile;
    _email = email;
    _firstName = firstName;
    _lastName = lastName;
    _gender = gender;
    _profilePic = profilePic;
    _address = address;
    _addon = addon;
    _city = city;
    _stateName = stateName;
    _cityName = cityName;
    _stateId = stateId;
    _countryId = countryId;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _mobile = json['mobile'];
    _email = json['email'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _gender = json['gender'];
    _profilePic = json['profile_pic'];
    _address = json['address'];
    _addon = json['addon'];
    _city = json['city'];
    _stateName = json['state_name'];
    _cityName = json['city_name'];
    _stateId = json['state_id'];
    _countryId = json['country_id'];
  }
  String? _id;
  String? _mobile;
  String? _email;
  String? _firstName;
  String? _lastName;
  String? _gender;
  dynamic _profilePic;
  String? _address;
  String? _addon;
  String? _city;
  String? _stateName;
  String? _cityName;
  String? _stateId;
  String? _countryId;
Data copyWith({  String? id,
  String? mobile,
  String? email,
  String? firstName,
  String? lastName,
  String? gender,
  dynamic profilePic,
  String? address,
  String? addon,
  String? city,
  String? stateName,
  String? cityName,
  String? stateId,
  String? countryId,
}) => Data(  id: id ?? _id,
  mobile: mobile ?? _mobile,
  email: email ?? _email,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  gender: gender ?? _gender,
  profilePic: profilePic ?? _profilePic,
  address: address ?? _address,
  addon: addon ?? _addon,
  city: city ?? _city,
  stateName: stateName ?? _stateName,
  cityName: cityName ?? _cityName,
  stateId: stateId ?? _stateId,
  countryId: countryId ?? _countryId,
);
  String? get id => _id;
  String? get mobile => _mobile;
  String? get email => _email;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get gender => _gender;
  dynamic get profilePic => _profilePic;
  String? get address => _address;
  String? get addon => _addon;
  String? get city => _city;
  String? get stateName => _stateName;
  String? get cityName => _cityName;
  String? get stateId => _stateId;
  String? get countryId => _countryId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['mobile'] = _mobile;
    map['email'] = _email;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['gender'] = _gender;
    map['profile_pic'] = _profilePic;
    map['address'] = _address;
    map['addon'] = _addon;
    map['city'] = _city;
    map['state_name'] = _stateName;
    map['city_name'] = _cityName;
    map['state_id'] = _stateId;
    map['country_id'] = _countryId;
    return map;
  }

}