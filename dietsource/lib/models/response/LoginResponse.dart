class LoginResponse {
  String? shortCode;
  String? code;
  int? errorCode;
  String? error;

  LoginResponse({this.shortCode, this.code, this.errorCode, this.error});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    shortCode = json['shortCode'];
    code = json['code'];
    errorCode = json['errorCode'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shortCode'] = this.shortCode;
    data['code'] = this.code;
    data['errorCode'] = this.errorCode;
    data['error'] = this.error;
    return data;
  }
}
