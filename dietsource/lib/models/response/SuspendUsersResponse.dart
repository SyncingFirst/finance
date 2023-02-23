class SuspendUsersResponse {
  String? statusCode;
  bool? suspend;

  SuspendUsersResponse({this.statusCode, this.suspend});

  SuspendUsersResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    suspend = json['suspend'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['suspend'] = this.suspend;
    return data;
  }
}
