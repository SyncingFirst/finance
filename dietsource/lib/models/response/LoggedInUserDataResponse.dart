class LoggedInUserDataResponse {
  String? activeTripId;
  String? firstName;
  String? lastAccessedAt;
  String? lastName;
  String? statusCode;
  String? username;
  String? verificationStatus;

  LoggedInUserDataResponse(
      {this.activeTripId,
        this.firstName,
        this.lastAccessedAt,
        this.lastName,
        this.statusCode,
        this.username,
        this.verificationStatus});

  LoggedInUserDataResponse.fromJson(Map<String, dynamic> json) {
    activeTripId = json['activeTripId'];
    firstName = json['firstName'];
    lastAccessedAt = json['lastAccessedAt'];
    lastName = json['lastName'];
    statusCode = json['statusCode'];
    username = json['username'];
    verificationStatus = json['verificationStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['activeTripId'] = this.activeTripId;
    data['firstName'] = this.firstName;
    data['lastAccessedAt'] = this.lastAccessedAt;
    data['lastName'] = this.lastName;
    data['statusCode'] = this.statusCode;
    data['username'] = this.username;
    data['verificationStatus'] = this.verificationStatus;
    return data;
  }
}
