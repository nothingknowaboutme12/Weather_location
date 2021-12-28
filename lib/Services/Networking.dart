import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
class NetworkHelper{
   String url;
  NetworkHelper({required this.url});
  Future getData() async {
    Response response=await get(Uri.parse(url),);
    if(response.statusCode==200){

      return jsonDecode(response.body);
    }
    else
      print(response.statusCode);
    print(url);
  }
}