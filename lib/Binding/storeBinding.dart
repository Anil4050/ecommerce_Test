import 'package:get/get.dart';
import 'package:tsc_tasc/Controller/dashbordController.dart';

class StoreBinding implements Bindings {
// default dependency
  @override
  void dependencies() {
    Get.lazyPut(() => DashbordController());
  }
}
