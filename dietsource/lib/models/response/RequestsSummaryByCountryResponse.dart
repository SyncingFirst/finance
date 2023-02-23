class RequestsSummaryByCountryResponse {
  String? statusCode;
  List<Summary>? summary;

  RequestsSummaryByCountryResponse({this.statusCode, this.summary});

  RequestsSummaryByCountryResponse.fromJson(Map<String, dynamic> json) {
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
  int? count;
  String? country;

  Summary({this.count, this.country});

  Summary.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    data['country'] = this.country;
    return data;
  }
}
