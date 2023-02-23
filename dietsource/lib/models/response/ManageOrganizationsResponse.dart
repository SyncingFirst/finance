class ManageOrganizationsResponse {
  Null? statusCode;
  int? totalPages;
  int? pageNumber;
  int? pageSize;
  List<Organizations>? organizations;

  ManageOrganizationsResponse({this.statusCode, this.totalPages, this.pageNumber, this.pageSize, this.organizations});

  ManageOrganizationsResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    totalPages = json['totalPages'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    if (json['organizations'] != null) {
      organizations = <Organizations>[];
      json['organizations'].forEach((v) {
        organizations!.add(new Organizations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    data['totalPages'] = this.totalPages;
    data['pageNumber'] = this.pageNumber;
    data['pageSize'] = this.pageSize;
    if (this.organizations != null) {
      data['organizations'] = this.organizations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Organizations {
  String? groupId;
  String? name;
  String? type;
  String? website;
  String? createdAt;
  Logo? logo;
  List<Contacts>? contacts;

  Organizations({this.groupId, this.name, this.type, this.website, this.createdAt, this.logo, this.contacts});

  Organizations.fromJson(Map<String, dynamic> json) {
    groupId = json['groupId'];
    name = json['name'];
    type = json['type'];
    website = json['website'];
    createdAt = json['createdAt'];
    logo = json['logo'] != null ? new Logo.fromJson(json['logo']) : null;
    if (json['contacts'] != null) {
      contacts = <Contacts>[];
      json['contacts'].forEach((v) {
        contacts!.add(new Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['groupId'] = this.groupId;
    data['name'] = this.name;
    data['type'] = this.type;
    data['website'] = this.website;
    data['createdAt'] = this.createdAt;
    if (this.logo != null) {
      data['logo'] = this.logo!.toJson();
    }
    if (this.contacts != null) {
      data['contacts'] = this.contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Logo {
  String? imageType;
  String? value;
  String? contentType;

  Logo({this.imageType, this.value, this.contentType});

  Logo.fromJson(Map<String, dynamic> json) {
    imageType = json['imageType'];
    value = json['value'];
    contentType = json['contentType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageType'] = this.imageType;
    data['value'] = this.value;
    data['contentType'] = this.contentType;
    return data;
  }
}

class Contacts {
  String? value;
  String? code;

  Contacts({this.value, this.code});

  Contacts.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['code'] = this.code;
    return data;
  }
}
