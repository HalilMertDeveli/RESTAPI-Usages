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

  User? userModel;

  Future<void> httpMethod() async {
    final String ethernetAddress = "https://reqres.in/api/users?page=2";

    final response = await http.get(Uri.parse(ethernetAddress));

    setState(() {
      if (response.statusCode < 300) {
        Map<String, dynamic> decodedResponse = jsonDecode(response.body);
        userModel = User.fromJson(decodedResponse);

        incomingResponseFromEthernet = decodedResponse['data'][0]['first_name'];
      } else {
        //incomingResponseFromEthernet = "There is some problem here";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: 6 ,
            itemBuilder: (context, index) {
              if (userModel?.data != null) {
                return ListTile(
                  title: Text(userModel!.data![index].firstName.toString()),
                  subtitle: Text(userModel!.data![index].lastName.toString().toUpperCase()),
                  leading: Image.network(userModel!.data![index].avatar.toString()),
                );
              }
              else{
                return CircularProgressIndicator();
              }
            }
          
           
          ),
        ),
        MaterialButton(
          onPressed: (){
            setState(() {
                httpMethod();
            });
          },
          child: Icon(Icons.gite_sharp),
          )
      ],
    );
  }
}
