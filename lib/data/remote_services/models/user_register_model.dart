/// first_name : "vaibhav"
/// last_name : "vaibhav"
/// email : "vaibhavpandey123@gmail.com"
/// mobile : "7988492351"
/// password : "123456"
/// gender : "male"
/// city : "57675"
/// state : "4007"
/// address : "Dera Saccha Soda"

class UserRegisterRequestModel {
  UserRegisterRequestModel({
      String? firstName, 
      String? lastName, 
      String? email, 
      String? mobile, 
      String? password, 
      String? gender, 
      String? city, 
      String? state, 
      String? address,}){
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _mobile = mobile;
    _password = password;
    _gender = gender;
    _city = city;
    _state = state;
    _address = address;
}

  set firstName(String? value) {
    _firstName = value;
  }

  UserRegisterRequestModel.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _mobile = json['mobile'];
    _password = json['password'];
    _gender = json['gender'];
    _city = json['city'];
    _state = json['state'];
    _address = json['address'];
  }
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _mobile;
  String? _password;
  String? _gender;
  String? _city;
  String? _state;
  String? _address;
UserRegisterRequestModel copyWith({  String? firstName,
  String? lastName,
  String? email,
  String? mobile,
  String? password,
  String? gender,
  String? city,
  String? state,
  String? address,
}) => UserRegisterRequestModel(  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  mobile: mobile ?? _mobile,
  password: password ?? _password,
  gender: gender ?? _gender,
  city: city ?? _city,
  state: state ?? _state,
  address: address ?? _address,
);
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get mobile => _mobile;
  String? get password => _password;
  String? get gender => _gender;
  String? get city => _city;
  String? get state => _state;
  String? get address => _address;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['mobile'] = _mobile;
    map['password'] = _password;
    map['gender'] = _gender;
    map['city'] = _city;
    map['state'] = _state;
    map['address'] = _address;
    return map;
  }

  set lastName(String? value) {
    _lastName = value;
  }

  set email(String? value) {
    _email = value;
  }

  set mobile(String? value) {
    _mobile = value;
  }

  set password(String? value) {
    _password = value;
  }

  set gender(String? value) {
    _gender = value;
  }

  set city(String? value) {
    _city = value;
  }

  set state(String? value) {
    _state = value;
  }

  set address(String? value) {
    _address = value;
  }
}