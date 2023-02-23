class LoginRequest {
  String? countryCode;
  String? email;
  String? language;
  String? phoneNumber;

  LoginRequest({this.countryCode, this.email, this.language, this.phoneNumber});

  LoginRequest.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    email = json['email'];
    language = json['language'];
    phoneNumber = json['phoneNumber'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryCode'] = this.countryCode;
    data['email'] = this.email;
    data['language'] = this.language;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}
