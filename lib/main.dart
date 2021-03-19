import 'package:flutter/material.dart';
import 'package:flutter_animation/1-Scroll_Top_Down/scroll_top_down_page.dart';
import 'package:flutter_animation/2-Sliver_App_bar/pages/advanced_sliver_app_bar.dart';
import 'package:flutter_animation/Models/pair.dart';
import 'package:get/get.dart';

import '2-Sliver_App_bar/pages/baisc_sliver_app_bar.dart';
import '2-Sliver_App_bar/pages/tabbed_sliver_app_bar.dart';

void main() {
  runApp(GetMaterialApp(home: Application()));
}

class Application extends StatelessWidget {
  final List<Pair> app = [
    Pair("Scroll Top Down", ScrollTopDownPage()),
    Pair("Sliver App Bar Basic", BasicSliverAppBar()),
    Pair("Sliver App Bar Advanced", AdvancedSliverAppBar()),
    Pair("Sliver App Bar With Tabs", TabBarSliverAppbar()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          itemCount: app.length,
          separatorBuilder: (_, __) => Divider(),
          itemBuilder: (_, i) => ListTile(
              leading: ClipOval(
                  child: Container(
                      width: 25,
                      height: 25,
                      color: Colors.greenAccent,
                      child: Center(child: Text("${i + 1}", style: TextStyle(color: Colors.white))))),
              title: Text(
                app[i].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Get.to(() => app[i].widget);
              })),
    );
  }
}
