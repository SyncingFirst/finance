class OTPVerificationRequest {
  String? shortCode;
  String? code;
  String? deviceId;

  OTPVerificationRequest({this.shortCode, this.code, this.deviceId});

  OTPVerificationRequest.fromJson(Map<String, dynamic> json) {
    shortCode = json['shortCode'];
    code = json['code'];
    deviceId = json['deviceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shortCode'] = this.shortCode;
    data['code'] = this.code;
    data['deviceId'] = this.deviceId;
    return data;
  }
}
