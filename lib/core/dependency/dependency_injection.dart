import 'package:get/get.dart';
import 'package:note_taker/ui/screens/home/controller/home_screen_controller.dart';
import 'package:note_taker/ui/screens/onBoarding/controller/on_boarding_screen_controller.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {

    ///================ Auth Controller =================

      Get.lazyPut(() => OnBoardingScreenController(), fenix: true);
      Get.lazyPut(() => HomeScreenController(), fenix: true);


  }

}