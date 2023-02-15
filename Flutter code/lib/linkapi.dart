class AppApiLinks {
  // static const server = "http://10.0.2.2/BudgetApp_Php";
  static const server =
      "https://budgetappflutter.000webhostapp.com/BudgetApp_Php";
  // ---------------- Authentication ----------------
  static const linklogin = "$server/Auth/login.php";
  static const linksignup = "$server/Auth/signup.php";
  static const linkverifycode = "$server/Auth/verifycode.php";
  static const linkforgetpasscheckemail =
      "$server/Auth/ForgetPassword/checkemail.php";
  static const linkforgetpassverifycode =
      "$server/Auth/ForgetPassword/forgetpasswordverifycode.php";
  static const linkresetpassword =
      "$server/Auth/ForgetPassword/resetpassword.php";
  static const linkdeleteuser = "$server/Auth/deleteuser.php";

  // ---------------- Budget ----------------
  static const linkviewbudget = "$server/Budget/View/viewbudget.php";
  static const linkhistory = "$server/Budget/View/history.php";
  static const linkdeletehistory = "$server/Budget/History/deletehistory.php";
  static const linkaddtransaction = "$server/Budget/addtransaction.php";
  static const linkaddautotransaction = "$server/Budget/addautotransaction.php";
  static const linkeditautotransaction =
      "$server/Budget/editautotransaction.php";
  static const linkdeleteautotransaction =
      "$server/Budget/deleteautotransaction.php";
  static const linkviewautotransactions =
      "$server/Budget/viewautotransactions.php";
  static const linkmodifyautotransactiondate =
      "$server/Budget/modifyautotransactiondate.php";
  static const linkviewaccountwallet =
      "$server/Budget/Bank Accounts and Wallets/viewaccount-wallet.php";
  static const linkaddaccountwallet =
      "$server/Budget/Bank Accounts and Wallets/addaccount-wallet.php";
  static const linkeditaccountwallet =
      "$server/Budget/Bank Accounts and Wallets/editaccount-wallet.php";
  static const linkdeleteaccountwallet =
      "$server/Budget/Bank Accounts and Wallets/deleteaccount-wallet.php";

  // ---------------- Profile ----------------
  static const linkeditusernamephone = "$server/Profile/editpusernamephone.php";
  static const linkchangeemail = "$server/Profile/profilechangeemail.php";
  static const linkgeneratecode = "$server/Profile/generatevcode.php";
  static const linkprofileverifycode = "$server/Profile/profileverifycode.php";

  // ---------------- Stats ----------------
  static const linkstatsthisweek = "$server/Stats/statsthisweek.php";
  static const linkstatsthismonth = "$server/Stats/statsthismonth.php";
  static const linkstatsthisyear = "$server/Stats/statsthisyear.php";
}
