import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class HttpsClient{

  static String domain="https://miapp.itying.com";

  static Dio dio = Dio();

  HttpsClient(){
    dio.options.baseUrl=domain;
    dio.options.connectTimeout=const Duration(milliseconds: 5000);
    dio.options.receiveTimeout=const Duration(milliseconds: 5000);

  }

  Future get(apiUrl) async{
    try{
      var response = await dio.get(apiUrl);
      if (kDebugMode) {
        print(response);
      }
      return response;
    }catch(e){
      if (kDebugMode) {
        print("请求超时$e");
      }
      return null;
    }
  }

  Future post(String apiUrl, {Map? data}) async {
    try {
      var response = await dio.post(apiUrl, data: data);
      return response;
    } catch (e) {
      print("请求超时");
      return null;
    }
  }

  static replaceUri(String picUrl){
    String tempUrl=domain+"/"+picUrl;
    return tempUrl.replaceAll("\\", "/");
  }
}