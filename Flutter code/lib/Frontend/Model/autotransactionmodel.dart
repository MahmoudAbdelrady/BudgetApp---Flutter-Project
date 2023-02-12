class AutoTransactionModel {
  int? autoTransID;
  int? userID;
  String? title;
  String? titleType;
  String? amount;
  String? type;
  String? actionRate;
  String? actionDate;

  AutoTransactionModel(
      {this.autoTransID,
      this.userID,
      this.title,
      this.titleType,
      this.amount,
      this.type,
      this.actionRate,
      this.actionDate});

  AutoTransactionModel.fromJson(Map<String, dynamic> json) {
    autoTransID = json['Auto_TransID'];
    userID = json['User_ID'];
    title = json['Title'];
    titleType = json['Title_Type'];
    amount = json['Amount'].toString();
    type = json['Type'];
    actionRate = json['ActionRate'];
    actionDate = json['ActionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Auto_TransID'] = autoTransID;
    data['User_ID'] = userID;
    data['Title'] = title;
    data['Title_Type'] = titleType;
    data['Amount'] = amount;
    data['Type'] = type;
    data['ActionRate'] = actionRate;
    data['ActionDate'] = actionDate;
    return data;
  }
}
