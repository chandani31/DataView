import 'package:api_data_view2/controller/DataViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'DetailPage.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final viewController = Get.put(ViewController());
  bool isOnTap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ViewController>(builder: (_){
        return ViewController().isLoading? Center(child: CircularProgressIndicator(),) :
            Container(
              width: double.infinity,
              height: double.infinity,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(4),
              child: ListView.builder(
                itemCount: viewController.dataList.length,
                  itemBuilder: (context, index){
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(index: index)));
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                        padding: EdgeInsets.only(left: 15, top: 12),
                        height: MediaQuery.of(context).size.height*0.16,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Colors.pink.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(2,3),
                          )]
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${viewController.dataList[index].name}"),
                            Text("${viewController.dataList[index].address?.city}"),
                            Text("${viewController.dataList[index].website}"),
                            Text("${viewController.dataList[index].company?.name}"),
                            Text("${viewController.dataList[index].phone}"),
                          ],
                        ),
                      ),
                    );
              }),
            );
      },),
    );
  }
}
