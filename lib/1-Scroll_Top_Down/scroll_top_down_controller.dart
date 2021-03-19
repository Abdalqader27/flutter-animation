import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScrollTopDownController extends GetxController {
  final controller = ScrollController();
  int index = 0;

  Widget buildList() => ListView.separated(
        itemCount: 50,
        controller: controller,
        shrinkWrap: true,
        separatorBuilder: (_, __) => Divider(),
        itemBuilder: (_, index) => ListTile(
            title: Center(
          child: Text(
            "${index + 1}",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )),
      );

  Widget buildBottomBar() => BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: IconButton(
              icon: Icon(Icons.arrow_upward),
              onPressed: scrollUp,
            ),
            title: Text("Top")),
        BottomNavigationBarItem(icon: IconButton(icon: Icon(Icons.arrow_downward_sharp), onPressed: scrollDown), title: Text("Down"))
      ]);

  void scrollUp() {
    final double start = 0;

    /// without animation
    /// controller.jumpTo(start);
    /// if you want animation using this
    controller.animateTo(start, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void scrollDown() {
    final double down = controller.position.maxScrollExtent;

    /// without animation
    /// controller.jumpTo(down);
    /// if you want animation using this
    controller.animateTo(down, duration: Duration(seconds: 1), curve: Curves.easeIn);
  }

  void listenScrolling() {
    if (controller.position.atEdge) {
      final isTop = controller.position.pixels == 0;
      if (isTop) {
        Get.snackbar("hey ", "reach top", backgroundColor: Colors.white, snackPosition: SnackPosition.TOP);
      } else
        Get.snackbar("hey ", "reach end", backgroundColor: Colors.white, snackPosition: SnackPosition.TOP);
    }
  }
}
