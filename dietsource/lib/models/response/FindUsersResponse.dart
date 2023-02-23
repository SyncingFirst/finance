class FindUsersResponse {
  int? pageNumber;
  int? pageSize;
  String? statusCode;
  int? totalPages;
  List<UserSearchResponseDtoList>? userSearchResponseDtoList;

  FindUsersResponse(
      {this.pageNumber,
        this.pageSize,
        this.statusCode,
        this.totalPages,
        this.userSearchResponseDtoList});

  FindUsersResponse.fromJson(Map<String, dynamic> json) {
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    statusCode = json['statusCode'];
    totalPages = json['totalPages'];
    if (json['userSearchResponseDtoList'] != null) {
      userSearchResponseDtoList = <UserSearchResponseDtoList>[];
      json['userSearchResponseDtoList'].forEach((v) {
        userSearchResponseDtoList!
            .add(new UserSearchResponseDtoList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    data['statusCode'] = this.statusCode;
    data['totalPages'] = this.totalPages;
    if (this.userSearchResponseDtoList != null) {
      data['userSearchResponseDtoList'] =
          this.userSearchResponseDtoList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserSearchResponseDtoList {
  String? countryCode;
  String? fullName;
  String? id;
  String? phoneNumber;
  String? region;
  String? lastModifiedAt;
  String? lastModifiedBy;
  bool? selected;

  UserSearchResponseDtoList(
      {this.countryCode,
        this.fullName,
        this.id,
        this.phoneNumber,
        this.region,
        this.lastModifiedAt,
        this.lastModifiedBy,
        this.selected});

  UserSearchResponseDtoList.fromJson(Map<String, dynamic> json) {
    countryCode = json['countryCode'];
    fullName = json['fullName'];
    id = json['id'];
    phoneNumber = json['phoneNumber'];
    region = json['region'];
    lastModifiedAt = json['lastModifiedAt'];
    lastModifiedBy = json['lastModifiedBy'];
    selected = json['selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryCode'] = this.countryCode;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['phoneNumber'] = this.phoneNumber;
    data['region'] = this.region;
    data['lastModifiedAt'] = this.lastModifiedAt;
    data['lastModifiedBy'] = this.lastModifiedBy;
    data['selected'] = this.selected;
    return data;
  }
}
