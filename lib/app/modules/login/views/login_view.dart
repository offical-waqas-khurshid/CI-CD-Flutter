import 'package:api_pratice/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart' as p;
import '../../account-statement/views/account_statement_view.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("height " + MediaQuery.of(context).size.height.toString());
    print("widtg " + MediaQuery.of(context).size.width.toString());
    controller.context = context;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
                onTap: () {
                  showCurrencyDialog(context);
                },
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                        padding: EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            height: 60,
                            width: 30,
                            child: Padding(
                                padding: EdgeInsets.only(top: 28.0),
                                child: Icon(Icons.person)))))),
            Container(
              height: 200,
              width: 300,
              color: Colors.green,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Get.to(AccountStatementView());
              },
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  void showCurrencyDialog(BuildContext loginScreenContext) {
    showGeneralDialog(
      context: loginScreenContext,
      barrierDismissible: false,
      transitionDuration: const Duration(milliseconds: 500),
      barrierLabel: MaterialLocalizations.of(loginScreenContext).dialogLabel,
      barrierColor: Colors.black.withOpacity(0.5),

      pageBuilder: (context, _, __) {
        return p.ResponsiveScaledBox(
            // ResponsiveScaledBox renders its child with a FittedBox set to the `width` value.
            // Set the fixed width value based on the active breakpoint.
            width: p.ResponsiveValue<double>(context,
                defaultValue: 450,
                conditionalValues: [
                  const p.Condition.between(start: 0, end: 300, value: 450),
                  const p.Condition.between(start: 301, end: 600, value: 400),
                  const p.Condition.between(start: 601, end: 900, value: 400),
                  const p.Condition.between(start: 901, end: 1200, value: 400),
                  const p.Condition.between(start: 1201, end: 1500, value: 400),
                  const p.Condition.between(start: 1501, end: 1800, value: 400),
                  const p.Condition.between(start: 1801, end: 2200, value: 400),

                  // There are no conditions for width over 1200
                  // because the `maxWidth` is set to 1200 via the MaxWidthBox.
                ]).value,
            child: stackM(context));
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: CurvedAnimation(
            parent: animation,
            curve: Curves.easeOut,
          ).drive(Tween<Offset>(
            begin: const Offset(0, -1.0),
            end: Offset.zero,
          )),
          child: child,
        );
      },
    );
  }

  Stack stackM(BuildContext context) {
    return Stack(
      //mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Positioned(
          top: 0,
          right: 4,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 5.0, left: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 70,
                  width: 30,
                  child: Padding(
                    padding: EdgeInsets.only(top: 28.0),
                    child: Icon(Icons.account_balance),
                  ),
                ),
              ),
            ),
          ),
        ),
        ClipPath(
          clipper: MultipleRoundedCurveClipper(),
          child: SizedBox(
            height: 220,
            child: Card(
              elevation: 2.0,
              child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  Icon(
                    Icons.account_balance,
                    size: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Hello',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text('Hello',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text('Hello',
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text('Hello',
                                style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("\$1,800.00",
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text("\$500.00",
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text("\$1288.06",
                                style: Theme.of(context).textTheme.titleLarge),
                            SizedBox(height: 5),
                            Text("\$120,000.00",
                                style: Theme.of(context).textTheme.titleLarge),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
