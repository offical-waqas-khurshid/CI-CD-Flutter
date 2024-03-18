import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/account_statement_controller.dart';


class AccountStatementWidget extends StatefulWidget {
  bool isCredit = false;
  String transactionAmount = "";
  String transactionDate = "";
  String accountBalance = "";
  String transactionDetail = "";
  Function()? onTap;

  AccountStatementWidget({
    Key? key,
    this.isCredit = false,
    this.accountBalance = "",
    this.transactionAmount = "",
    this.transactionDate = "",
    this.transactionDetail = "",
    this.onTap,
  }) : super(key: key);

  @override
  State<AccountStatementWidget> createState() => _AccountStatementWidgetState();
}

class _AccountStatementWidgetState extends State<AccountStatementWidget> {
  //

  AccountStatementController accountStatementController =
      Get.find<AccountStatementController>();

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        child: Card(
          surfaceTintColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Theme(
              data:
                  Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                dense: false,
                onExpansionChanged: (value) {
                  // accountStatementController.toggleExpansion(value);
                  isExpanded = value;
                  setState(() {});
                },
                maintainState: true,
                //expandedAlignment: Alignment.topLeft,
                expandedCrossAxisAlignment: CrossAxisAlignment.start,

                childrenPadding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                tilePadding: EdgeInsets.all(8.0),
                collapsedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.r),
                ),
                collapsedBackgroundColor: Colors.grey,
                shape: const Border(),
                backgroundColor: Colors.grey,
                leading: SizedBox(
                  height: 35.h,
                  width: 35.w,
                  child: CircleAvatar(
                      backgroundColor: widget.isCredit
                          ? Colors.grey
                          : Colors.grey,
                      child: Padding(
                          padding: EdgeInsets.all(2.0),
                          child: Icon(
                              color: Colors.grey,
                              widget.isCredit
                                  ? Icons.arrow_downward_outlined
                                  : Icons.arrow_upward_outlined))),
                ),
                trailing: isExpanded
                    ? const SizedBox()
                    : Column(
                        children: [
                          Text(widget.accountBalance,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey,)),
                          Text(
                              'helo',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                title: isExpanded
                    ? const SizedBox()
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.transactionAmount,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey,)),
                          Text(widget.transactionDate,
                              style: Theme.of(context).textTheme.labelSmall),
                        ],
                      ),
                children: [
                  Text(widget.transactionAmount,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey,)),
                  SizedBox(height: 5.h),
                  Text(widget.transactionDetail,
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(height: 5.h),
                  Text(widget.transactionDate,
                      style: Theme.of(context).textTheme.labelSmall),
                  SizedBox(height: 5.h),
                  Text("Balance", style: Theme.of(context).textTheme.bodySmall),
                  SizedBox(height: 3.h),
                  Text(widget.accountBalance,
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(color: Colors.grey,)),
                ],
              )),
        ),
      ),
    );
  }
}
