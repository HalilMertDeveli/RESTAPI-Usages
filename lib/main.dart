import 'dart:convert';
import 'package:api_app_for_post_man/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(),
      body: Body(),
    ),
  ));
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String? incomingResponseFromEthernet;

  UserModel ? userModel;

  Future<void> httpMethod() async {
    final String ethernetAddress = "https://reqres.in/api/users?page=2";

    final response = await http.get(Uri.parse(ethernetAddress));

    setState(() {
      if (response.statusCode < 300) {
        Map decodedResponse = jsonDecode(response.body);
        userModel=UserModel.fromJson(decodedResponse);

        incomingResponseFromEthernet = decodedResponse['data'][0]['first_name'];
      } else {
        //incomingResponseFromEthernet = "There is some problem here";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
          "Response:",
          style: TextStyle(fontSize: 30),
        ),
        Text(
          incomingResponseFromEthernet.toString(),
        ),
        Text( userModel?.data != null ? userModel!.data!.email! : "Total is null"),
        MaterialButton(
          onPressed: () {
            httpMethod();
          },
          child: Icon(Icons.get_app_sharp),
        ),
      ],
    );
  }
}
