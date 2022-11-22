import 'package:cocon_app/model/itemModel.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  RxList<ItemModel> outerList = <ItemModel>[].obs;
  RxList<ItemModel> topList = <ItemModel>[].obs;
  RxString plusPageType = ''.obs;
}