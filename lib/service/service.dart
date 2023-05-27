import 'dart:convert';

import 'package:api_app_for_post_man/model/single_user.dart';
import 'package:http/http.dart' as http;

class SingleUserService {
  final String url = "https://reqres.in/api/users?page=2";
  Future<SingleUser?> fetchUser() async {
    final responseFromUrl = await http.get(Uri.parse(url));
    try {
      if (responseFromUrl.statusCode == 200) {
        var dataFromEthernet = SingleUser.fromJson(jsonDecode(responseFromUrl.body));
        print("Our type is ${dataFromEthernet.runtimeType}");
        return dataFromEthernet;
        
      } else {
        print("three is status code error");
        
      }
    } catch (e) {
      print(e);
      print("Something worgn");
    }
    
  }
}
