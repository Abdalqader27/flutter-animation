import 'package:flutter/material.dart';
import 'package:flutter_animation/2-Sliver_App_bar/widget/image_widget.dart';

class AdvancedSliverAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: CustomSliverAppBarDelegate(expandedHeight: 300),
              pinned: true,
            ),
            buildImages(),
          ],
        ),
      );

  Widget buildImages() => SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) => ImageWidget(index: index),
          childCount: 20,
        ),
      );
}

class CustomSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  const CustomSliverAppBarDelegate({
    @required this.expandedHeight,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    final size = 60;
    final top = expandedHeight - shrinkOffset - size / 2;

    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        buildBackground(shrinkOffset),
        buildAppBar(shrinkOffset),
        Positioned(
          top: top,
          left: 20,
          right: 20,
          child: buildFloating(shrinkOffset),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Sliver App Bar"),
          centerTitle: true,
        ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          'https://source.unsplash.com/random?mono+dark',
          fit: BoxFit.cover,
        ),
      );

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Expanded(child: buildButton(text: 'Share', icon: Icons.share)),
              Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
            ],
          ),
        ),
      );

  Widget buildButton({@required String text, @required IconData icon}) => TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
