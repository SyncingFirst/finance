class ManageOrganizationUsersRequest {
  String? groupId;
  int? pageNumber;
  int? pageSize;
  String? searchText;

  ManageOrganizationUsersRequest(
      {this.groupId, this.pageNumber, this.pageSize, this.searchText});

  ManageOrganizationUsersRequest.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    searchText = json['searchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['searchText'] = this.searchText;
    return data;
  }
}
