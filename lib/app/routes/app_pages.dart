import 'package:api_pratice/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as p;
import 'package:responsive_framework/responsive_framework.dart';

import '../modules/account-statement/bindings/account_statement_binding.dart';
import '../modules/account-statement/views/account_statement_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/login/bindings/login_binding.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => p.MaxWidthBox(
        // A widget that limits the maximum width.
        // This is used to create a gutter area on either side of the content.
        maxWidth: 2000,
        background: Container(color: const Color(0xFFF5F5F5)),
        child: p.ResponsiveScaledBox(
          // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
          // Set the fixed width value based on the active breakpoint.
            width: p.ResponsiveValue<double>(Get.context!,
                defaultValue: 360,
                conditionalValues: [
                  const p.Condition.between(start: 0, end: 300, value: 200),
                  const p.Condition.between(start: 301, end: 600, value: 400),
                  const p.Condition.between(start: 601, end: 900, value: 400),
                  const p.Condition.between(start: 901, end: 1200, value: 400),
                  const p.Condition.between(start: 1201, end: 1500, value: 400),
                  const p.Condition.between(start: 1501, end: 1800, value: 400),
                  const p.Condition.between(start: 1801, end: 2200, value: 400),


                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
            child: LoginView()),
      ) ,
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.ACCOUNT_STATEMENT,
      page: () =>p.MaxWidthBox(
        // A widget that limits the maximum width.
        // This is used to create a gutter area on either side of the content.
        maxWidth: 1200,
        background: Container(color: const Color(0xFFF5F5F5)),
        child: p.ResponsiveScaledBox(
          // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
          // Set the fixed width value based on the active breakpoint.
            width: p.ResponsiveValue<double>(Get.context!,
                conditionalValues: [
                  const p.Condition.equals(name: MOBILE, value: 600),
                  const p.Condition.between(
                      start: 800, end: 1100, value: 800),
                  const p.Condition.between(
                      start: 1000, end: 1200, value: 1000),
                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
            child: AccountStatementView()),
      ) ,
      binding: AccountStatementBinding(),
    ),
  ];
}
