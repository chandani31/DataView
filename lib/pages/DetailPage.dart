import 'package:api_data_view2/controller/DataViewController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  final int index;
  DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  final viewController = Get.put(ViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details"),),
      body: GetBuilder<ViewController>(builder: (_){
        return Column(
          children: [
            SizedBox(height: 120,),
            Container(
              margin: EdgeInsets.only(left: 35, right: 45),
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.width*5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.pink.withOpacity(0.2),
                boxShadow: [BoxShadow(
                  color:Colors.pink.withOpacity(0.3),
                  blurRadius: 0.5,
                  spreadRadius: 0.3,
                  offset: Offset(2,3),
                )],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("${viewController.dataList[widget.index].website}"),
                  Text("${viewController.dataList[widget.index].email}"),
                  Text("${viewController.dataList[widget.index].address?.street}"),
                ],
              ),
            ),
          ],
        );
      },),
    );
  }
}
