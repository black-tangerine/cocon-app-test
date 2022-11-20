import 'package:cocon_app/model/itemModel.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  RxList<ItemModel> outerList = <ItemModel>[].obs;
  RxList<ItemModel> topList = <ItemModel>[].obs;
  RxInt plusPageType = 1.obs; //type 1 : 아우터 2 : 상의

}