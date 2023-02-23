class UnSuspendUsersRequest {
  List<String>? userIds;

  UnSuspendUsersRequest({this.userIds});

  UnSuspendUsersRequest.fromJson(Map<String, dynamic> json) {
    userIds = json['userIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userIds'] = this.userIds;
    return data;
  }
}
