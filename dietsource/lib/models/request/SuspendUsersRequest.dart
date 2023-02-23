class SuspendUsersRequest {
  List<String>? userIds;

  SuspendUsersRequest({this.userIds});

  SuspendUsersRequest.fromJson(Map<String, dynamic> json) {
    userIds = json['userIds'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userIds'] = this.userIds;
    return data;
  }
}
