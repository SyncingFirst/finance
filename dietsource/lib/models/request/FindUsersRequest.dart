class FindUsersRequest {
  int? pageNumber;
  int? pageSize;
  String? searchText;
  String? sortOrder;
  String? status;

  FindUsersRequest(
      {this.pageNumber,
        this.pageSize,
        this.searchText,
        this.sortOrder,
        this.status});

  FindUsersRequest.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    searchText = json['searchText'];
    sortOrder = json['sortOrder'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['searchText'] = this.searchText;
    data['sortOrder'] = this.sortOrder;
    data['status'] = this.status;
    return data;
  }
}
