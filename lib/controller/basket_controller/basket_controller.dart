import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class WordsController extends GetxController {
  var words = <SimpleModel>[].obs;
  var isButtonHide = true.obs;
  SimpleModel? simpleModel;
  @override
  void onInit() {
    addWord();
    super.onInit();
  }
  void addWord() {
    words.add(SimpleModel( value: 1,title: 'Add'));
    update();
  }
}
class SimpleModel {
  int value;
  String title;
  SimpleModel({
    required this.value,
    required this.title,
  });
}