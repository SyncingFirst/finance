class GenerateOtpRequest {
  String? otpType;
  List<String>? userIds;

  GenerateOtpRequest({this.otpType, this.userIds});

  GenerateOtpRequest.fromJson(Map<String, dynamic> json) {
    otpType = json['otpType'];
    userIds = json['userIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otpType'] = this.otpType;
    data['userIds'] = this.userIds;
    return data;
  }
}
