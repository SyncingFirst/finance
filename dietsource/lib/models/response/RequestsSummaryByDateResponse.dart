class RequestsSummaryByDateResponse {
  Summary? summary;
  List<ByDateSummary>? byDateSummary;

  RequestsSummaryByDateResponse({this.summary, this.byDateSummary});

  RequestsSummaryByDateResponse.fromJson(Map<String, dynamic> json) {
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
  HelpRequest? helpRequest;
  HelpRequest? giveAway;
  InfoCard? infoCard;

  Summary({this.helpRequest, this.giveAway, this.infoCard});

  Summary.fromJson(Map<String, dynamic> json) {
    helpRequest = json['helpRequest'] != null
        ? new HelpRequest.fromJson(json['helpRequest'])
        : null;
    giveAway = json['giveAway'] != null
        ? new HelpRequest.fromJson(json['giveAway'])
        : null;
    infoCard = json['infoCard'] != null
        ? new InfoCard.fromJson(json['infoCard'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.helpRequest != null) {
      data['helpRequest'] = this.helpRequest!.toJson();
    }
    if (this.giveAway != null) {
      data['giveAway'] = this.giveAway!.toJson();
    }
    if (this.infoCard != null) {
      data['infoCard'] = this.infoCard!.toJson();
    }
    return data;
  }
}

class HelpRequest {
  int? total;
  int? completed;
  int? cancelled;
  int? waiting;

  HelpRequest({this.total, this.completed, this.cancelled, this.waiting});

  HelpRequest.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    completed = json['completed'];
    cancelled = json['cancelled'];
    waiting = json['waiting'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['completed'] = this.completed;
    data['cancelled'] = this.cancelled;
    data['waiting'] = this.waiting;
    return data;
  }
}

class InfoCard {
  int? total;
  int? valid;
  int? expired;

  InfoCard({this.total, this.valid, this.expired});

  InfoCard.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    valid = json['valid'];
    expired = json['expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['valid'] = this.valid;
    data['expired'] = this.expired;
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
