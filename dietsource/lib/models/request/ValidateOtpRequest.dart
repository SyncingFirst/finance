class ValidateOtpRequest {
  List<String>? codes;
  String? otp;
  List<String>? userIds;

  ValidateOtpRequest({this.codes, this.otp, this.userIds});

  ValidateOtpRequest.fromJson(Map<String, dynamic> json) {
    codes = json['codes'].cast<String>();
    otp = json['otp'];
    userIds = json['userIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['codes'] = this.codes;
    data['otp'] = this.otp;
    data['userIds'] = this.userIds;
    return data;
  }
}
