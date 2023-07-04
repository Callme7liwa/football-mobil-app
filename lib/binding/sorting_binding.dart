import 'package:get/get.dart';
import 'package:my_flutter_application/controllers/SortingController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SortingController>(
          () => SortingController(),
    );
  }
}