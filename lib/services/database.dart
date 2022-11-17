import 'dart:convert';
import 'dart:io';

import 'package:cocon_app/controller/mainController.dart';
import 'package:cocon_app/model/itemModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
class DatabaseService {
  DatabaseService._privateConstructor();

  static final DatabaseService _instance = DatabaseService._privateConstructor();

  static DatabaseService get instance => _instance;

  final MainController _mainController = Get.find();

  Future<List<ItemModel>> getOuterData() async{
    http.Response response = await http.get(
      Uri.parse('https://cf-api-c.brandi.me/v1/web/categories/218/products?offset=0&limit=100&type=all&order=popular'),
      headers: {
        HttpHeaders.authorizationHeader : '3b17176f2eb5fdffb9bafdcc3e4bc192b013813caddccd0aad20c23ed272f076_1423639497',
      }
    );

    final responseJson = jsonDecode(response.body);
    List<ItemModel> outerList = (responseJson['data'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
    _mainController.outerList.assignAll(outerList);
    return outerList;
  }

  Future<List<ItemModel>> getTopData() async{
    http.Response response = await http.get(
        Uri.parse('https://cf-api-c.brandi.me/v1/web/categories/373/products?offset=0&limit=100&type=all&order=popular'),
        headers: {
          HttpHeaders.authorizationHeader : '3b17176f2eb5fdffb9bafdcc3e4bc192b013813caddccd0aad20c23ed272f076_1423639497',
        }
    );

    final responseJson = jsonDecode(response.body);
    List<ItemModel> topList = (responseJson['data'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
    _mainController.topList.assignAll(topList);
    return topList;
  }
}