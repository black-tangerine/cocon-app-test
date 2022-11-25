import 'package:cocon_app/controller/main_controller.dart';
import 'package:cocon_app/model/item_model.dart';
import 'package:cocon_app/screens/plus_page.dart';
import 'package:cocon_app/services/database.dart';
import 'package:cocon_app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//enum type {outer , top}

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {

  final MainController _mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('COCON',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              outerList(),
              topList()
            ],
          ),
        ));
  }

  Widget category(String categoryText) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 10.0),
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(categoryText,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
            plusButton(categoryText),
          ],
        ),
      ),
    );
  }

  Widget outerList() {
    return Column(
      children: [
        category('아우터'),
        SizedBox(
            height: Get.height / 2,
            child: FutureBuilder<List<ItemModel>>(
              future: DatabaseService.instance.getOuterData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(color: Colors.orange,),);
                }
                if(!snapshot.hasData){
                  return const Center(child: Text('none'),);
                }
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.6,
                        crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      ItemModel item = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: itemContainer(item)
                      );
                    }
                );
              }
            )
        ),
      ],
    );
  }

  Widget topList() {
    return Column(
      children: [
        category('상의'),
        SizedBox(
            height: Get.height / 2,
            child: FutureBuilder<List<ItemModel>>(
              future : DatabaseService.instance.getTopData(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(color: Colors.orange,),);
                }
                if(!snapshot.hasData){
                  return const Center(child: Text('none'),);
                }
                return GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.6,
                      crossAxisCount: 2,
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      ItemModel item = snapshot.data![index];
                      return Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: itemContainer(item),
                      );
                    }
                );
              }
            )
        ),
      ],
    );
  }

  Widget itemContainer(ItemModel item){
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
                item.imageThumbnailUrl as String,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                  if(loadingProgress == null){
                    return child;
                  }
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    )
                  );
              },
            ),
          ),
        ),
        SizedBox(
          height: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(item.sellerName as String,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(item.name as String,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                  overflow: TextOverflow.ellipsis,),
              ),
              item.salePercent != 0 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${item.salePercent.toString()}%',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red
                    ),
                  ),
                  Text('${Utils.comma(item.salePrice as int).toString()}원',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Expanded(
                    child: Text('${Utils.comma(item.price as int).toString()}원',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        color: Colors.grey,
                        overflow: TextOverflow.ellipsis,
                        decoration: TextDecoration.lineThrough
                      ),
                    ),
                  ),
                ],
              ) :
              Text('${Utils.comma(item.salePrice as int).toString()}원',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget plusButton(String type){
    return GestureDetector(
      onTap: () {
        _mainController.plusPageType.value = type;
        Get.to(() => const PlusPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(6.0)
        ),
        height: 30,
        width: 70,
        child: const Center(
          child: Text('더보기',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
