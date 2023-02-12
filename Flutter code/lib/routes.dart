import 'package:get/get.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/approutes.dart';
import 'package:mainflutterproject/Frontend/Middleware/appmiddleware.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/Forget%20Password/forgetpassverifycode.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/Forget%20Password/forgetpassword.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/Forget%20Password/resetpassword.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/Forget%20Password/successreset.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/login.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/signup.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/successsignup.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Auth/verifycode.dart';
import 'package:mainflutterproject/Frontend/View/Screen/Home/homescreen.dart';
import 'package:mainflutterproject/Frontend/View/Screen/OnBoarding.dart';
import 'package:mainflutterproject/Frontend/View/Screen/language.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [AppMiddleWare()]),
  GetPage(name: AppRoutes.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoutes.login, page: () => const Login()),
  GetPage(name: AppRoutes.signup, page: () => const SignUp()),
  GetPage(name: AppRoutes.verifycode, page: () => const VerifyCode()),
  GetPage(name: AppRoutes.successsignup, page: () => const SuccessSignUp()),
  GetPage(name: AppRoutes.forgetpass, page: () => const ForgetPassword()),
  GetPage(
      name: AppRoutes.forgetpassverifycode,
      page: () => const ForgetPassVerifyCode()),
  GetPage(name: AppRoutes.resetpassword, page: () => const ResetPassword()),
  GetPage(name: AppRoutes.successreset, page: () => const SuccessReset()),
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
];
