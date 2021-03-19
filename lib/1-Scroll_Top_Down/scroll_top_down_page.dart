import 'package:flutter/material.dart';
import 'package:flutter_animation/1-Scroll_Top_Down/scroll_top_down_controller.dart';
import 'package:get/get.dart';

final controller = Get.put(ScrollTopDownController());

class ScrollTopDownPage extends StatefulWidget {
  @override
  _ScrollTopDownState createState() => _ScrollTopDownState();
}

class _ScrollTopDownState extends State<ScrollTopDownPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.controller.addListener(controller.listenScrolling);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scroll Top Down Page")),
      body: controller.buildList(),
      bottomNavigationBar: controller.buildBottomBar(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: controller.scrollUp,
      ),
    );
  }
}
