import 'package:flutter/material.dart';
import 'package:flutter_animation/2-Sliver_App_bar/widget/image_widget.dart';

class TabBarSliverAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                SliverAppBar(
                  title: Text("Sliver With Taped "),
                  bottom: TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.map), text: 'Tab 1'),
                      Tab(icon: Icon(Icons.portrait), text: 'Tab 2'),
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                buildImages(),
                buildImages(),
              ],
            ),
          ),
        ),
      );

  Widget buildImages() => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => ImageWidget(index: index),
      );
}
