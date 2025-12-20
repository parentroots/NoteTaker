import 'package:get/get.dart';
import 'package:note_taker/ui/screens/onBoarding/controller/on_boarding_screen_controller.dart';

class DependencyInjection extends Bindings{
  @override
  void dependencies() {


    ///================ Auth Controller =================
      Get.lazyPut(() => OnBoardingScreenController(), fenix: true);


  }

}