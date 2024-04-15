import 'package:digi/app/presentation/utils/app_binding.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    AppBindings().dependencies();
  }
}
