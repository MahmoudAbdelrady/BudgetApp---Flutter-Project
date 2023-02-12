class HistoryModel {
  int? userID;
  String? title;
  String? titleType;
  String? quantity;
  String? type;
  String? date;
  int? transactionID;

  HistoryModel(
      {this.userID,
      this.title,
      this.titleType,
      this.quantity,
      this.type,
      this.date,
      this.transactionID});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    title = json['Title'];
    titleType = json['Title_Type'];
    quantity = json['Quantity'].toString();
    type = json['Type'];
    date = json['Date'];
    transactionID = json['TransactionID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['User_ID'] = userID;
    data['Title'] = title;
    data['Title_Type'] = titleType;
    data['Quantity'] = quantity;
    data['Type'] = type;
    data['Date'] = date;
    data['TransactionID'] = transactionID;
    return data;
  }
}
