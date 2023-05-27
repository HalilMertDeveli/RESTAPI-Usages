import 'package:api_app_for_post_man/model/single_user.dart';
import 'package:api_app_for_post_man/service/service.dart';
import 'package:flutter/material.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
  });

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  final SingleUserService? singleUserService = SingleUserService();
  List<SingleUser?> singleUserList = [];

  @override
  void initState() {
    singleUserService?.fetchUser().then((SingleUser? value) {
      if (value?.data != null && value != null) {
        setState(() {
          singleUserList = value.data! as List<SingleUser?>;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Hello world"),

        MaterialButton(
          onPressed: () {
            setState(() {
              singleUserService?.fetchUser().then((SingleUser? value) {
                if (value?.data != null && value != null) {
                  setState(() {
                    singleUserList = value.data! as List<SingleUser?>;
                  });
                }
              });
            });
          },
          child: Icon(Icons.incomplete_circle_rounded),
        )
      ],
    );
  }
}
