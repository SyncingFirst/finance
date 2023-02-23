class SampleTransactionsDtoModel {
  List<Transactions>? transactions;

  SampleTransactionsDtoModel({this.transactions});

  SampleTransactionsDtoModel.fromJson(Map<String, dynamic> json) {
    if (json['transactions'] != null) {
      transactions = <Transactions>[];
      json['transactions'].forEach((v) {
        transactions!.add(new Transactions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.transactions != null) {
      data['transactions'] = this.transactions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Transactions {
  String? amount;
  String? type;
  String? description;

  Transactions({this.amount, this.type, this.description});

  Transactions.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['description'] = this.description;
    return data;
  }
}
