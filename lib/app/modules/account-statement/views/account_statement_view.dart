import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/account_statement_controller.dart';

class AccountStatementView extends GetView<AccountStatementController> {
  const AccountStatementView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccountStatementView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('hello',
                style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500)),
            Text('hello',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 12, fontWeight: FontWeight.w500)),
            Text('hello',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
            Text('hello',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 15),
            // Container(
            //   height: 300,
            //   child: ListView.builder(
            //     itemCount: 15,
            //     itemBuilder: (context, index) {
            //       return AccountStatementWidget(
            //         onTap: (){},
            //         accountBalance: "\$70,000",
            //         transactionDate: "October 31, 2023",
            //         transactionAmount: "Rs. 9,000",
            //         transactionDetail: "Atm-ibft Funds Transfer, Fr: Bilal Sabir",
            //       );
            //     },),
            // ),
          ],
        ),
      ),
    );
  }
}
