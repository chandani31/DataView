import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/DataModel.dart';

class ViewController extends GetxController
{
  bool isLoading = false;
  Dio dio = Dio();
  List<DataModel> dataList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }

  void startLoading(){
    isLoading = true;
    update();
  }
  void stopLoading(){
    isLoading = false;
    update();
  }

  Future<void> getData() async{

    try{
      startLoading();
      var response = await dio.get("https://jsonplaceholder.typicode.com/users");
      print(response.data);

      if(response.statusCode == 200)
      {
        stopLoading();
        final List body =response.data;
        print(body.toString());
        dataList.addAll((body).map((e) => DataModel.fromJson(e)));
        print("dataList: $dataList");
      }
      else
        {
          print(response.statusCode.toString());
        }
    }
    catch(e)
    {
      print(e.toString());
    }
  }
}