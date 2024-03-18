import 'package:get/get.dart';

class AccountStatementController extends GetxController {
  RxString selectedAccountNumber = '133321'.obs;
  RxBool isExpanded = false.obs;
  bool isCredit = false;
  List<String> accountNumberList = [
    "133321",
    "535326746",
    "768765579",
    "908967564",
    "123254365",
  ];

  toggleExpansion(bool value) {
    isExpanded.value = value;
  }
}
