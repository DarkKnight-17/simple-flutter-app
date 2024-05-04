import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentFormController extends GetxController {
  RxString currentComment = ''.obs;
  RxString currentDropDownValue = 'one'.obs;
  RxString currentOptionalNumberOfDays = '2'.obs;
  RxBool buttonIsDisabled = true.obs;
  RxString errorTextForComment = ''.obs;
  RxString errorTextForNumberOfDays = ''.obs;
  Rx<Color?> saveButtonBackgroundColor = Colors.grey[500].obs;
  // Rx<Function()?> onSaved = null.obs;
}
