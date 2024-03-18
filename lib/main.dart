import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      builder: (context, child) =>  ResponsiveBreakpoints.builder(
        child: child!,
        breakpoints: [
          const Breakpoint(start: 0, end: 300, name: "m1"),
          const Breakpoint(start: 301, end: 600, name: "m2"),
          const Breakpoint(start: 601, end: 900, name: "m3"),
          const Breakpoint(start: 901, end: 1200, name: "m4"),
          const Breakpoint(start: 1201, end: 1500, name: "m5"),
          const Breakpoint(start: 1501, end: 1800, name: "m6"),
          const Breakpoint(start: 1801, end: double.infinity, name: '4K'),
        ],
      ),
     initialRoute: Routes.LOGIN,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}