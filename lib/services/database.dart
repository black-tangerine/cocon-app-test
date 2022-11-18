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

  Future<List<ItemModel>> getItemData(int type) async{
    http.Response response = await http.get(
      Uri.parse((type == 0) ?
      'https://cf-api-c.brandi.me/v1/web/categories/218/products?offset=0&limit=100&type=all&order=popular'
          : 'https://cf-api-c.brandi.me/v1/web/categories/373/products?offset=0&limit=100&type=all&order=popular'
      ),
      headers: {
        HttpHeaders.authorizationHeader : '3b17176f2eb5fdffb9bafdcc3e4bc192b013813caddccd0aad20c23ed272f076_1423639497',
      }
    );
    if(response.statusCode == 200){
      final responseJson = jsonDecode(response.body);
      List<ItemModel> itemList = (responseJson['data'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
      (type == 0) ? _mainController.outerList.assignAll(itemList) : _mainController.topList.assignAll(itemList);
      return itemList;
    } else if(response.statusCode == 429){
      Future.delayed(const Duration(seconds: 10), () async{
        await getItemData(type);
      });
    }
    return [];
  }

  // Future<List<ItemModel>> getOuterData() async{
  //   http.Response response = await http.get(
  //     Uri.parse('https://cf-api-c.brandi.me/v1/web/categories/218/products?offset=0&limit=100&type=all&order=popular'),
  //     headers: {
  //       HttpHeaders.authorizationHeader : '3b17176f2eb5fdffb9bafdcc3e4bc192b013813caddccd0aad20c23ed272f076_1423639497',
  //     }
  //   );
  //
  //   final responseJson = jsonDecode(response.body);
  //   List<ItemModel> outerList = (responseJson['data'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
  //   _mainController.outerList.assignAll(outerList);
  //   return outerList;
  // }
  //
  // Future<List<ItemModel>> getTopData() async{
  //   http.Response response = await http.get(
  //       Uri.parse('https://cf-api-c.brandi.me/v1/web/categories/373/products?offset=0&limit=100&type=all&order=popular'),
  //       headers: {
  //         HttpHeaders.authorizationHeader : '3b17176f2eb5fdffb9bafdcc3e4bc192b013813caddccd0aad20c23ed272f076_1423639497',
  //       }
  //   );
  //
  //   final responseJson = jsonDecode(response.body);
  //   List<ItemModel> topList = (responseJson['data'] as List).map((e) => ItemModel.fromJson(e as Map<String, dynamic>)).toList();
  //   _mainController.topList.assignAll(topList);
  //   return topList;
  // }

  // HTTP RESPONSE CODE
  // 1xx(정보) : 요청을 받았으며 프로세스를 계속 진행합니다.
  // 2xx(성공) : 요청을 성공적으로 받았으며 인식했고 수용하였습니다.
  // 3xx(리다이렉션) : 요청 완료를 위해 추가 작업 조치가 필요합니다.
  // 4xx(클라이언트 오류) : 요청의 문법이 잘못되었거나 요청을 처리할 수 없습니다.
  // 5xx(서버 오류) : 서버가 명백히 유효한 요청에 대한 충족을 실패했습니다.

}