import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return null;
  }


  @override
  GetPage? onPageCalled(GetPage? page) {
    print("Navigating to: ${page?.name}");
    return page;
  }

  @override
  Transition? get transition => Transition.fade;

  @override
  Duration? get transitionDuration => const Duration(milliseconds: 500);
}
