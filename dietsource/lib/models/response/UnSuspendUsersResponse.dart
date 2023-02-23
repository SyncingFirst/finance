class UnSuspendUsersResponse {
  String? statusCode;
  bool? unSuspend;

  UnSuspendUsersResponse({this.statusCode, this.unSuspend});

  UnSuspendUsersResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    unSuspend = json['unSuspend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['unSuspend'] = this.unSuspend;
    return data;
  }
}
