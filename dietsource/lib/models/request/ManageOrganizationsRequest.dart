class ManageOrganizationsRequest {
  int? pageNumber;
  int? pageSize;
  String? searchText;

  ManageOrganizationsRequest({this.pageNumber, this.pageSize, this.searchText});

  ManageOrganizationsRequest.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    searchText = json['searchText'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['searchText'] = this.searchText;
    return data;
  }
}
