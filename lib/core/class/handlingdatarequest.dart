import 'package:ecommerceapp/core/class/statusrequest.dart';
import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

import '../constant/imageassets.dart';

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {super.key, required this.statusRequest, required this.widget});

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(
            child: Lottie.asset(
              ImagesAssets.loading,
              height: 250,
              width: 250,
            ),
          )
        : statusRequest == StatusRequest.serverFailure
            ? Center(
                child: Lottie.asset(
                ImagesAssets.offLine,
                height: 250,
                width: 250,
              ))
            : statusRequest == StatusRequest.offlineFailure
                ? Center(
                    child: Lottie.asset(
                    ImagesAssets.serverError,
                    height: 250,
                    width: 250,
                  ))
                : widget;
  }
}
