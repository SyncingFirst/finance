class DeleteUsersResponse {
  bool? delete;
  String? statusCode;

  DeleteUsersResponse({this.delete, this.statusCode});

  DeleteUsersResponse.fromJson(Map<String, dynamic> json) {
    delete = json['delete'];
    statusCode = json['statusCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['delete'] = this.delete;
    data['statusCode'] = this.statusCode;
    return data;
  }
}
