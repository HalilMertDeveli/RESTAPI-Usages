import 'package:api_app_for_post_man/home_page_body.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("HomePage AppBar"),),
      body: HomePageBody(),
    ),
  ));
}