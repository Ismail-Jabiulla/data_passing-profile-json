import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:w_day13_profile_json/profile_item.dart';

class ProfilePageScreen extends StatefulWidget {
  const ProfilePageScreen({super.key});

  @override
  State<ProfilePageScreen> createState() => _ProfilePageScreenState();
}

class _ProfilePageScreenState extends State<ProfilePageScreen> {
  List _items = [];

  Future<void> readJson() async {
    final String respons =
        await rootBundle.loadString('assets/jsonfiles/data.json');
    final data = await jsonDecode(respons);
    _items = data["info"];
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white10,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        onPressed: () {}),
                    Text(
                      'Profile',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),

              //Name, Photo
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset('assets/images/Rectangle 1.jpg'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'Mahmud Saimon',
                        style:
                            TextStyle(color: Colors.pinkAccent, fontSize: 26),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        'example@website.com',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              ListView.builder(
                itemCount: _items.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final item = _items[index];
                  final length = _items.length;
                  return ProfileItem(title: item["title"], subTitle: item["sub"], image: item["image"], index: index, length: length);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
