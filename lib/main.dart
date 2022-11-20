import 'package:cocon_app/screens/lobby.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cocon_app/controller/mainController.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return GetMaterialApp(
      title: 'COCON APP',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      initialBinding: BindingsBuilder(() => {
        Get.put(MainController())
      }),
      home: const Lobby(),
    );
  }
}

// const => 선언부 무조건 값 final => 선언시 값 부여 x 가능

//Todo
/*
1. lefthook 설치 잘못되었음. global으로 설치 필요.

2. lefthook.yaml 내용은 지우지 말고 작업.

3. analysis_options.yaml의 규칙을 준수하며 코드 작성.
    prefer_single_quotes: true // " => '
    avoid_print: true // print x
    sort_pub_dependencies: false // pubspec.yaml A to Z
    avoid_setters_without_getters: false

4. PR을 생성하여 main 브랜치에 머지하는 방식으로 변경
  1) branch 생성
   - git checkout -b 'branch Name'
   - git branch // branch check
  2) git push origin 'branch Name' // origin => my repo
  3) PR 생성
  4) Merge 이후 pull & delete branch

5. 커밋 메시지를 작업의 내용을 유추할수 있는 의미있는 메시지 작성
FEAT : 새로운 기능의 추가


FIX: 버그 수정
DOCS: 문서 수정
STYLE: 스타일 관련 기능(코드 포맷팅, 세미콜론 누락, 코드 자체의 변경이 없는 경우)
REFACTOR: 코드 리펙토링
TEST: 테스트 코트, 리펙토링 테스트 코드 추가
CHORE: 빌드 업무 수정, 패키지 매니저 수정(ex .gitignore 수정 같은 경우)
ADD, REMOVE, USE, REFACTOR, SIMPLIFY, UPDATE, IMPROVE, MAKE, IMPLEMENT, REVISE...
*/

