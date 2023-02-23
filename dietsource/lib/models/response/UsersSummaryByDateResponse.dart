class UsersSummaryByDateResponse {
  Summary? summary;
  List<ByDateSummary>? byDateSummary;

  UsersSummaryByDateResponse({this.summary, this.byDateSummary});

  UsersSummaryByDateResponse.fromJson(Map<String, dynamic> json) {
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
    if (json['byDateSummary'] != null) {
      byDateSummary = <ByDateSummary>[];
      json['byDateSummary'].forEach((v) {
        byDateSummary!.add(new ByDateSummary.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    if (this.byDateSummary != null) {
      data['byDateSummary'] =
          this.byDateSummary!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Summary {
  int? total;
  int? active;
  int? suspended;
  int? deleted;

  Summary({this.total, this.active, this.suspended, this.deleted});

  Summary.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    active = json['active'];
    suspended = json['suspended'];
    deleted = json['deleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['active'] = this.active;
    data['suspended'] = this.suspended;
    data['deleted'] = this.deleted;
    return data;
  }
}

class ByDateSummary {
  String? date;
  Summary? summary;

  ByDateSummary({this.date, this.summary});

  ByDateSummary.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    summary =
    json['summary'] != null ? new Summary.fromJson(json['summary']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    if (this.summary != null) {
      data['summary'] = this.summary!.toJson();
    }
    return data;
  }
}
