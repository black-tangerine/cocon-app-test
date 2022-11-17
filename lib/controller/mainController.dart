import 'package:cocon_app/model/itemModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController{
  RxList<ItemModel> outerList = <ItemModel>[].obs;
  RxList<ItemModel> topList = <ItemModel>[].obs;
  RxInt plusPage_type = 1.obs;

}