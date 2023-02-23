class GenerateOtpResponse {
  List<String>? codes;
  String? statusCode;

  GenerateOtpResponse({this.codes, this.statusCode});

  GenerateOtpResponse.fromJson(Map<String, dynamic> json) {
    codes = json['codes'].cast<String>();
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codes'] = this.codes;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
