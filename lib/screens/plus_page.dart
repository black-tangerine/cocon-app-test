import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cocon_app/controller/main_controller.dart';
import 'package:cocon_app/model/item_model.dart';
import 'package:cocon_app/util/utils.dart';

//enum type { outer, top }

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
          icon: const Icon(Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Obx(() => category()),
            Obx(() =>  _mainController.plusPageType.value == '아우터' ? outerGridView() : topGridView()),
          ],
        ),
      ),
    );
  }

  Widget category() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal : 10.0),
      child: SizedBox(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(_mainController.plusPageType.value,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget outerGridView(){
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
            ),
            itemCount: _mainController.outerList.length,
            itemBuilder: (BuildContext context, int index){
              ItemModel item = _mainController.outerList[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: itemContainer(item),
              );

            })
    );
  }

  Widget topGridView(){
    return Expanded(
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.6,
              crossAxisCount: 2,
            ),
            itemCount: _mainController.topList.length,
            itemBuilder: (BuildContext context, int index){
              ItemModel item = _mainController.topList[index];
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: itemContainer(item),
              );

            })
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
}
