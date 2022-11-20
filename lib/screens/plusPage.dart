import 'package:cocon_app/controller/mainController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/itemModel.dart';
import '../util/utils.dart';

class PlusPage extends StatefulWidget {
  const PlusPage({Key? key}) : super(key: key);

  @override
  State<PlusPage> createState() => _PlusPageState();
}

class _PlusPageState extends State<PlusPage> {

  final MainController _mainController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => category()),
            Obx(() => itemGridView()),
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 10.0),
      child: Container(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_mainController.plusPage_type.value == 1 ? '아우터' : '상의',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget itemGridView(){
    List<ItemModel> itemList = [];
    (_mainController.plusPage_type.value == 1 ? itemList.assignAll(_mainController.outerList) : itemList.assignAll(_mainController.topList));
    return Expanded(
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.6,
            crossAxisCount: 2,
          ),
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index) {
            ItemModel item = itemList[index];
            return Padding(
              padding: const EdgeInsets.all(15.0),
              child: itemContainer(item),
            );
          }
      ),
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
}
