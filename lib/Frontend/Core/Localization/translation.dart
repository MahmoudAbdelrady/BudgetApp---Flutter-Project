import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "ar": {
          "Onboarding_Title1": "مرحباً إلى محفظة النقود",
          "Onboarding_Body1": "تحكم في أموالك وادخرها من خلال تتبع نفقاتك",
          "Onboarding_Title2": "وفر المال بكل سهولة",
          "Onboarding_Body2":
              "يمكنك إنشاء الميزانيات بسهولة ، ومعرفة مقدار ما أنفقته",
          "Onboarding_Title3": "تتبع فواتيرك كما لم يحدث من قبل",
          "Onboarding_Body3":
              "أنشئ ميزانية مخصصة بناءً على دخلك وفواتيرك وأهدافك",
          "NextButton": "التالي",
          "SkipButton": "تخطي",
          "GetSButton": "البدء",
          "Login": "تسجيل الدخول",
          "Username TBH": "إسم المستخدم",
          "Email TBH": "البريد الإلكتروني",
          "Phone TBH": "رقم الهاتف",
          "Password TBH": "كلمة المرور",
          "RePassword TBH": "إعادة كلمة المرور",
          "Login CheckboxText": "تذكرني",
          "Login ForgetPass": "نسيت كلمة المرور ؟",
          "Login Footer 1": " ليس لديك حساب؟ ",
          "Login Footer 2": "سجّل الآن",
          "SignUp": "إنشاء حساب",
          "SignUp Footer 1": " لديك حساب بالفعل؟",
          "SignUp Footer 2": "تسجيل الدخول",
          "emptyCheck": "هذا الحقل لا يمكن أن يكون فارغا",
          "minCheck": "هذا الحقل لا يمكن أن يكون أقل من ",
          "maxCheck": "هذا الحقل لا يمكن أن يكون أكثر من",
          "usernameCheck": "من فضلك أدخل إسم مستخدم صالح",
          "emailCheck": "من فضلك أدخل بريد إلكتروني صالح",
          "phoneCheck": "من فضلك أدخل رقم هاتف صالح",
          "ForgetPass": "نسيت\nكلمة المرور؟",
          "ForgetPassSub":
              "لا تقلق! هذا يحدث. من فضلك أدخل\nالبريد الإلكتروني الخاص بحسابك.",
          "ResetPass": "تغيير\nكلمة المرور",
          "OTP Title": "أدخل رمز التحقق",
          "OTP Subtitle":
              "أدخل رمز التحقق المكون من 5 أرقام المرسل إلى بريدك الإلكتروني",
          "Successful Create": "لقد تم إنشاء حسابك بنجاح",
          "Successful reset": "لقد تم تغيير كلمة المرور الخاصة بك بنجاح.",
          "ChangePass": "تغيير كلمة المرور",
          "Submit": "تأكيد",
          "Alert": "تحذير",
          "Attention": "إنتباه",
          "Error": "خطأ",
          "Login failed": "إسم المستخدم أو كلمة المرور خاطئة",
          "SignUp failed": "البريد الإلكتروني أو رقم الهاتف مسجل بالفعل",
          "VerifyCodeFailed": "من فضلك أدخل الرمز الصحيح",
          "CheckEmail": "هذا الحساب غير مسجل",
          "PassMatch":
              "كلمة المرور غير متطابقة.\nمن فضلك أعد إدخال كلمة المرور مرة أخرى.",
          "UnexError": "خطأ غير متوقع. من فضلك حاول مرة أخرى.",
          "Exit Alert": "تنبيه بالخروج",
          "ConfExit": "هل تريد الخروج من التطبيق؟",
          "Yes": "نعم",
          "No": "لا",
          "AppName": "محفظة النقود",
          "This week stats": "إحصائيات هذا الإسبوع",
          "View Stats": "عرض الإحصائيات",
          "Income": "الدخل",
          "Expence": "النفقات",
          "IncomeNoThe": "دخل",
          "ExpenceNoThe": "نفقات",
          "Available Balance": "النقود المتاحة",
          "Latest transactions": "أحدث المعاملات",
          "View History": "عرض التاريخ",
          "History": "التاريخ",
          "transDelete": "هل تريد حذف هذه المعاملة ؟",
          "All": "الكل",
          "Add Transaction": "إضافة معاملة",
          "Income/Expence": "دخل/نفقات",
          "Add auto transaction": "إضافة معاملة تلقائية",
          "Auto Income/Expence": "دخل/نفقات تلقائي",
          "Home": "الرئيسية",
          "Stats": "إحصائيات",
          "Budget": "المحفظة",
          "Settings": "الإعدادات",
          "Title": "الإسم",
          "Title type": "النوع",
          "Amount": "الكمية",
          "Transaction date": "تاريخ المعاملة",
          "transDateAlert": "من فضلك حدد تاريخ المعاملة",
          "Save": "حفظ",
          "Clear": "مسح",
          "Start date": "تاريخ البدء",
          "startDateAlert": "من فضلك حدد تاريخ البدء",
          "Ok": "حسنا",
          "This Week": "هذا الإسبوع",
          "This Month": "هذا الشهر",
          "This Year": "هذه السنة",
          "Bank accounts & wallets": "الحسابات البنكية & المحافظ",
          "My auto transactions": "معاملاتي التلقائية",
          "Bank Accounts": "الحسابات البنكية",
          "Wallets": "المحافظ",
          "AWName": "إسم المحفظة/الحساب: ",
          "AWAmount": "الكمية: ",
          "AWType": "إختر النوع:",
          "SAW": "إختر حسابك البنكي/محفظتك",
          "Edit": "تعديل",
          "Auto Transactions": "المعاملات التلقائية",
          "EditAT": "تعديل المعاملة التلقائية",
          "delAutoT": "هل تريد حذف هذه المعاملة التلقائية؟",
          "Theme": "السمة",
          "Language": "اللغة",
          "English": "إنجليزي",
          "Arabic": "عربي",
          "Profile Info": "بيانات الحساب",
          "Email": "البريد\nالإلكتروني",
          "Phone": "الهاتف",
          "Logout": "تسجيل خروج",
          "Edit Profile": "تعديل الحساب",
          "UsName": "إسم المستخدم: ",
          "Email:": "البريدالإلكتروني: ",
          "Change Email": "تغيير البريد الإلكتروني",
          "Password": "كلمة المرور",
          "Change Password": "تغيير كلمة المرور",
          "Phone: ": "رقم الهاتف: ",
          "Confirm": "تأكيد",
          "Cancel": "إلغاء",
          "Select Date": "إختر التاريخ",
          "Enter Date": "أدخل التاريخ",
          "mm/dd/yyyy": "شهر/يوم/سنة",
          "AutoTransAddSuccess": "تمت إضافة المعاملة التلقائية بنجاح",
          "AutoTransAddFail": "فشل إضافة المعاملة التلقائية",
          "Status": "الحالة",
          "CorrectTypeAlert": "من فضلك إختر أنواع صحيحة",
          "TransAddSuccess": "تمت إضافة المعاملة بنجاح",
          "TransAddFail": "فشل إضافة المعاملة",
          "ChooseTypeAlert": "من فضلك أختر النوع",
          "AutoTransEditSuccess": "تم تعديل معاملتك التلقائية بنجاح",
          "AutoTransEditFail":
              "فشل تعديل معاملتك التلقائية. من فضلك حاول مرة أخرى",
          "ChooseAWAlert": "من فضلك أختر حسابك البنكي/محفظتك",
          "EmailMatchAlert":
              "بريدك الإلكتروني غير متطابق. من فضلك أعد الإدخال أخرى",
          "PrevEmailAlert":
              "لقد أدخلت بريدك الإلكتروني السابق. من أفضلك أدخل بريد جديد",
          "EmailUpdateSuccess": "تم تحديث بريدك الإلكتروني بنجاح",
          "ErrorOccur": "حدث خطأ ما. من فضلك حاول مرة أخرى",
          "ProfileUpdateSuccess": "تم تحديث بيانات حسابك بنجاح",
          "LogoutConfirm": "هل تريد تسجيل الخروج؟",
          "Change your email": "تغيير بريدك الإلكتروني",
          "Enter email": "أدخل البريد الإلكتروني",
          "ReEnter email": "أعد إدخال البريد الإلكتروني",
          "Change email": "تغيير البريد الإلكتروني",
          "Choose transaction type": "إختر نوع المعاملة",
          "Day": "يوم",
          "Week": "إسبوع",
          "Daily": "يومي",
          "Weekly": "إسبوعي",
          "Monthly": "شهري",
          "Yearly": "سنوي",
          "Choose rate": "إختر المعدل",
          "New account/wallet": "حساب/محفظة جديد",
          "Add money": "إضافة نقود",
          "Bank Account": "حساب بنكي",
          "Wallet": "محفظة",
          "Current theme": "السمة الحالية",
          "Light mode": "وضع الضوء",
          "Current language": "اللغة الحالية",
          "Jan": "يناير",
          "Feb": "فبراير",
          "Mar": "مارس",
          "Apr": "أبريل",
          "May": "مايو",
          "Jun": "يونيو",
          "Jul": "يوليو",
          "Aug": "أغسطس",
          "Sep": "سبتمبر",
          "Oct": "أكتوبر",
          "Nov": "نوفمبر",
          "Dec": "ديسمبر",
        },
        "en": {
          "Onboarding_Title1": "Welcome to Wallet-E",
          "Onboarding_Body1":
              "Take control of your money and \n save them by tracking your expenses",
          "Onboarding_Title2": "Save money with ease",
          "Onboarding_Body2":
              "Easily create budgets, and \n see how much did you spend",
          "Onboarding_Title3": "Track your bills like never before",
          "Onboarding_Body3":
              "Build a personalized budget based \n on your income, bills and goals you set",
          "NextButton": "Next",
          "SkipButton": "Skip",
          "GetSButton": "Get Started",
          "Login": "Login",
          "Username TBH": "Username",
          "Email TBH": "Email",
          "Phone TBH": "Phone",
          "Password TBH": "Password",
          "RePassword TBH": "Re-Password",
          "Login CheckboxText": "Remember me",
          "Login ForgetPass": "Forget Password ?",
          "Login Footer 1": "Not a member? ",
          "Login Footer 2": "Register",
          "SignUp": "Sign Up",
          "SignUp Footer 1": "Already a member? ",
          "SignUp Footer 2": "Login",
          "emptyCheck": "This field can't be empty",
          "minCheck": "This field can't be less than ",
          "maxCheck": "This field can't be longer than ",
          "usernameCheck": "Please enter a valid username",
          "emailCheck": "Please enter a valid email",
          "phoneCheck": "Please enter a valid phone number",
          "ForgetPass": "Forgot\nPassword?",
          "ForgetPassSub":
              "Don't worry! It happens. Please enter the\naddress associated with your account.",
          "ResetPass": "Reset\nPassword",
          "OTP Title": "Enter OTP",
          "OTP Subtitle": "Enter the 5 digit code sent to your email",
          "Successful Create": "You have created your account successfully",
          "Successful reset": "You have reset your password successfully",
          "ChangePass": "Change password",
          "Submit": "Submit",
          "Alert": "Alert",
          "Attention": "Attention",
          "Error": "Error",
          "Login failed": "Incorrect username or password",
          "SignUp failed": "Email or phone already exists",
          "VerifyCodeFailed": "Please enter the correct verification code",
          "CheckEmail": "This email is not registered",
          "PassMatch":
              "Password doesn't match.\nPlease re-enter the password again",
          "UnexError": "Unexpected error. Please try again",
          "Exit Alert": "Exit Alert",
          "ConfExit": "Do you want to exit the app?",
          "Yes": "Yes",
          "No": "No",
          "AppName": "Wallet-E",
          "Available Balance": "Available Balance",
          "This week stats": "This week stats",
          "View Stats": "View Stats",
          "Income": "Income",
          "Expence": "Expence",
          "IncomeNoThe": "Income",
          "ExpenceNoThe": "Expence",
          "Latest transactions": "Latest transactions",
          "View History": "View History",
          "History": "History",
          "transDelete": "Do you want to delete this transaction ?",
          "All": "All",
          "Add Transaction": "Add Transaction",
          "Income/Expence": "Income/Expence",
          "Add auto transaction": "Add auto transaction",
          "Auto Income/Expence": "Auto Income/Expence",
          "Home": "Home",
          "Stats": "Stats",
          "Budget": "Budget",
          "Settings": "Settings",
          "Title": "Title",
          "Title type": "Title type",
          "Amount": "Amount",
          "Transaction date": "Transaction date",
          "transDateAlert": "Please choose the transaction date",
          "Save": "Save",
          "Clear": "Clear",
          "Start date": "Start date",
          "startDateAlert": "Please choose a starting date",
          "Ok": "Ok",
          "This Week": "This Week",
          "This Month": "This Month",
          "This Year": "This Year",
          "Bank accounts & wallets": "Bank accounts & wallets",
          "My auto transactions": "My auto transactions",
          "Bank Accounts": "Bank Accounts",
          "Wallets": "Wallets",
          "AWName": "Account/Wallet name: ",
          "AWAmount": "Amount: ",
          "AWType": "Choose type: ",
          "SAW": "Select your account/wallet:",
          "Edit": "Edit",
          "Auto Transactions": "Auto Transactions",
          "EditAT": "Edit auto transaction",
          "delAutoT": "Do you want to delete this auto transaction ?",
          "Theme": "Theme",
          "Language": "Language",
          "English": "English",
          "Arabic": "Arabic",
          "Profile Info": "Profile Info",
          "Email": "Email",
          "Phone": "Phone",
          "Logout": "Logout",
          "Edit Profile": "Edit Profile",
          "UsName": "Username: ",
          "Email:": "Email:",
          "Change Email": "Change Email",
          "Password": "Password",
          "Change Password": "Change Password",
          "Phone: ": "Phone: ",
          "Confirm": "Confirm",
          "Cancel": "Cancel",
          "Select Date": "Select Date",
          "Enter Date": "Enter Date",
          "mm/dd/yyyy": "mm/dd/yyyy",
          "AutoTransAddSuccess": "Auto transaction added successfully",
          "AutoTransAddFail": "Auto transaction adding failed",
          "CorrectTypeAlert": "Please choose correct types",
          "Status": "Status",
          "TransAddSuccess": "Transaction added successfully",
          "TransAddFail": "Transaction adding failed",
          "ChooseTypeAlert": "Please choose a type",
          "AutoTransEditSuccess":
              "Your auto transaction has been edited successfully",
          "AutoTransEditFail":
              "Your auto transaction editing has failed. Please try again",
          "ChooseAWAlert": "Please choose your account/wallet",
          "EmailMatchAlert":
              "Your email doesn't match. Please enter your email again",
          "PrevEmailAlert":
              "This is your previous email. Please enter a new one.",
          "EmailUpdateSuccess": "Your email has been updated successfully",
          "ErrorOccur": "Error occurred. Please try again.",
          "ProfileUpdateSuccess": "Profile details updated successfully",
          "LogoutConfirm": "Do you want to logout ?",
          "Change your email": "Change your email",
          "Enter email": "Enter your email",
          "ReEnter email": "ReEnter your email",
          "Change email": "Change email",
          "Choose transaction type": "Choose transaction type",
          "Day": "Day",
          "Week": "Week",
          "Daily": "Daily",
          "Weekly": "Weekly",
          "Monthly": "Monthly",
          "Yearly": "Yearly",
          "Choose rate": "Choose rate",
          "New account/wallet": "New account/wallet",
          "Add money": "Add money",
          "Bank Account": "Bank Account",
          "Wallet": "Wallet",
          "Current theme": "Current theme",
          "Light mode": "Light mode",
          "Current language": "Current language",
          "Jan": "Jan",
          "Feb": "Feb",
          "Mar": "Mar",
          "Apr": "Apr",
          "May": "May",
          "Jun": "Jun",
          "Jul": "Jul",
          "Aug": "Aug",
          "Sep": "Sep",
          "Oct": "Oct",
          "Nov": "Nov",
          "Dec": "Dec",
        }
      };
}
