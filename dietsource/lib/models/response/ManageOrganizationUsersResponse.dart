class ManageOrganizationUsersResponse {
  List<OrganizationUsers>? organizationUsers;
  int? pageNumber;
  int? pageSize;
  String? statusCode;
  int? totalPages;

  ManageOrganizationUsersResponse(
      {this.organizationUsers, this.pageNumber, this.pageSize, this.statusCode, this.totalPages});

  ManageOrganizationUsersResponse.fromJson(Map<String, dynamic> json) {
    if (json['organizationUsers'] != null) {
      organizationUsers = <OrganizationUsers>[];
      json['organizationUsers'].forEach((v) {
        organizationUsers!.add(new OrganizationUsers.fromJson(v));
      });
    }
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    statusCode = json['statusCode'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.organizationUsers != null) {
      data['organizationUsers'] = this.organizationUsers!.map((v) => v.toJson()).toList();
    }
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['statusCode'] = this.statusCode;
    data['totalPages'] = this.totalPages;
    return data;
  }
}

class OrganizationUsers {
  String? invitedByUserName;
  String? joinDate;
  String? userName;
  bool? selected;

  OrganizationUsers({this.invitedByUserName, this.joinDate, this.userName, this.selected});

  OrganizationUsers.fromJson(Map<String, dynamic> json) {
    invitedByUserName = json['invitedByUserName'];
    joinDate = json['joinDate'];
    userName = json['userName'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['invitedByUserName'] = this.invitedByUserName;
    data['joinDate'] = this.joinDate;
    data['userName'] = this.userName;
    data['selected'] = this.selected;
    return data;
  }
}
