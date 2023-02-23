class UsersSummaryByCountryResponse {
  String? statusCode;
  List<Summary>? summary;

  UsersSummaryByCountryResponse({this.statusCode, this.summary});

  UsersSummaryByCountryResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    if (json['summary'] != null) {
      summary = <Summary>[];
      json['summary'].forEach((v) {
        summary!.add(new Summary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.summary != null) {
      data['summary'] = this.summary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  String? country;
  int? users;

  Summary({this.country, this.users});

  Summary.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    users = json['users'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['users'] = this.users;
    return data;
  }
}
