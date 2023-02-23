class ValidateOtpResponse {
  String? statusCode;

  ValidateOtpResponse({this.statusCode});

  ValidateOtpResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    return data;
  }
}
