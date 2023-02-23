class OTPVerificationResponse {
  String? errorCode;
  String? statusCode;
  String? token;

  OTPVerificationResponse({this.errorCode, this.statusCode, this.token});

  OTPVerificationResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    statusCode = json['statusCode'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['statusCode'] = this.statusCode;
    data['token'] = this.token;
    return data;
  }
}
