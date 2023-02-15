class AccountWalletModel {
  String? name;
  String? amount;
  String? type;
  String? userID;
  // int? userID;
  String? iD;
  // int? iD;

  AccountWalletModel({this.name, this.amount, this.type, this.userID, this.iD});

  AccountWalletModel.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    amount = json['Amount'].toString();
    type = json['Type'];
    userID = json['User_ID'];
    iD = json['ID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Name'] = name;
    data['Amount'] = amount;
    data['Type'] = type;
    data['User_ID'] = userID;
    data['ID'] = iD;
    return data;
  }
}
