class AppApiLinks {
  static const server = "http://10.0.2.2/BudgetApp_Php";
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

  // ---------------- Budget Modification ----------------
  static const linkviewbudget = "$server/Budget/View/viewbudget.php";
  static const linkviewexpinc = "$server/Budget/View/viewexpinc.php";
  static const linkhistory = "$server/Budget/View/history.php";
  static const linkaddbudget = "$server/Budget/addtotalbudget.php";
  static const linkaddtransaction = "$server/Budget/addtransaction.php";
}
