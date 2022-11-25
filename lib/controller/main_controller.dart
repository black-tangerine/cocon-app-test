import 'package:get/get.dart';
import 'package:cocon_app/model/item_model.dart';

class MainController extends GetxController{
  RxList<ItemModel> outerList = <ItemModel>[].obs;
  RxList<ItemModel> topList = <ItemModel>[].obs;
  RxString plusPageType = ''.obs;
}
