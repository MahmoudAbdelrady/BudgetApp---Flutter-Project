import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mainflutterproject/Backend/Core/Classes/statusrequest.dart';
import 'package:mainflutterproject/Frontend/Core/Constants/appassets.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Lottie.asset(AppAssets.loading)
        : statusRequest == StatusRequest.offlinefailure
            ? Lottie.asset(AppAssets.offline)
            : statusRequest == StatusRequest.serverfailure
                ? Lottie.asset(AppAssets.servererror)
                : statusRequest == StatusRequest.failure
                    ? Lottie.asset(AppAssets.serverexception)
                    : statusRequest == StatusRequest.empty
                        ? Lottie.asset(AppAssets.empty,
                            repeat: false, height: 250, width: 250)
                        : widget;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Lottie.asset(AppAssets.loading)
        : statusRequest == StatusRequest.offlinefailure
            ? Lottie.asset(AppAssets.offline)
            : statusRequest == StatusRequest.serverfailure
                ? Lottie.asset(AppAssets.servererror)
                : widget;
  }
}
