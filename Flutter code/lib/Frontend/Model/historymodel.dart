class HistoryModel {
  String? userID;
  // int? userID;
  String? awName;
  String? awType;
  String? title;
  String? quantity;
  String? type;
  String? date;
  // int? transactionID;
  String? transactionID;

  HistoryModel(
      {this.userID,
      this.awName,
      this.awType,
      this.title,
      this.quantity,
      this.type,
      this.date,
      this.transactionID});

  HistoryModel.fromJson(Map<String, dynamic> json) {
    userID = json['User_ID'];
    awName = json['AW_Name'];
    awType = json['AW_Type'];
    title = json['Title'];
    quantity = json['Quantity'].toString();
    // quantity = json['Quantity'];
    type = json['Type'];
    date = json['Date'];
    transactionID = json['TransactionID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['User_ID'] = userID;
    data['AW_Name'] = awName;
    data['AW_Type'] = awType;
    data['Title'] = title;
    data['Quantity'] = quantity;
    data['Type'] = type;
    data['Date'] = date;
    data['TransactionID'] = transactionID;
    return data;
  }
}
