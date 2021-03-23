import 'package:get/get.dart';
import 'package:tajiryol/pages/profile/provider/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(
      () => LanguageController(),
    );
  }
}
