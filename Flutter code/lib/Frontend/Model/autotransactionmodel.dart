class AutoTransactionModel {
  // int? autoTransID;
  String? autoTransID;
  String? userID;
  String? awName;
  String? awType;
  // String? userID;
  String? title;
  String? amount;
  String? type;
  String? actionRate;
  String? actionDate;

  AutoTransactionModel(
      {this.autoTransID,
      this.userID,
      this.awName,
      this.awType,
      this.title,
      this.amount,
      this.type,
      this.actionRate,
      this.actionDate});

  AutoTransactionModel.fromJson(Map<String, dynamic> json) {
    autoTransID = json['Auto_TransID'];
    userID = json['User_ID'];
    awName = json['AW_Name'];
    awType = json['AW_Type'];
    title = json['Title'];
    amount = json['Amount'].toString();
    type = json['Type'];
    actionRate = json['ActionRate'];
    actionDate = json['ActionDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Auto_TransID'] = autoTransID;
    data['User_ID'] = userID;
    data['AW_Name'] = awName;
    data['AW_Type'] = awType;
    data['Title'] = title;
    data['Amount'] = amount;
    data['Type'] = type;
    data['ActionRate'] = actionRate;
    data['ActionDate'] = actionDate;
    return data;
  }
}
