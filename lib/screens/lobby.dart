import 'package:cocon_app/controller/mainController.dart';
import 'package:cocon_app/model/itemModel.dart';
import 'package:cocon_app/screens/plusPage.dart';
import 'package:cocon_app/services/database.dart';
import 'package:cocon_app/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
        title: Text('Cocon',
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

  Widget category(String categoryText, int type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 10.0),
      child: Container(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(categoryText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
            plusButton(type),
          ],
        ),
      ),
    );
  }

  Widget outerList() {
    return Column(
      children: [
        category('아우터', 1),
        Container(
            height: Get.height / 2,
            child: FutureBuilder<List<ItemModel>>(
              future: DatabaseService.instance.getItemData(0),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator(color: Colors.orange,),);
                if(!snapshot.hasData || snapshot.data?.length == 0)
                  return Center(child: Text('none'),);
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
        category('상의', 2),
        Container(
            height: Get.height / 2,
            child: FutureBuilder<List<ItemModel>>(
              future : DatabaseService.instance.getItemData(1),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting)
                  return Center(child: CircularProgressIndicator(color: Colors.orange,),);
                if(!snapshot.hasData || snapshot.data?.length == 0)
                  return Center(child: Text('none'),);
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                item.image_thumbnail_url as String,
              loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress){
                  if(loadingProgress == null){
                    return child;
                  }
                  return Center(
                    child: CircularProgressIndicator(
                      color: Colors.orange,
                    )
                  );
              },
            ),
          ),
        ),
        Container(
          height: 70,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(item.seller_name as String,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(item.name as String,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                  ),
                  overflow: TextOverflow.ellipsis,),
              ),
              item.sale_percent != 0 ?
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('${item.sale_percent.toString()}%',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.red
                    ),
                  ),
                  Text('${Utils.comma(item.sale_price as int).toString()}원',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                  Expanded(
                    child: Text('${Utils.comma(item.price as int).toString()}원',
                      style: TextStyle(
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
              Text('${Utils.comma(item.sale_price as int).toString()}원',
                style: TextStyle(
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

  Widget plusButton(int type){
    return GestureDetector(
      onTap: () {
        _mainController.plusPage_type.value = type;
        Get.to(() => PlusPage());
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orange[200],
          borderRadius: BorderRadius.circular(6.0)
        ),
        height: 30,
        width: 70,
        child: Center(
          child: Text('더보기',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
