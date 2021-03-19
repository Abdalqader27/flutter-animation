import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final int index;

  const ImageWidget({
    Key key,
    @required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        height: 150,
        width: double.infinity,
        child: Card(
          elevation: 0,
          clipBehavior: Clip.antiAlias,
          margin: EdgeInsets.all(5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Image.network(
            'https://source.unsplash.com/random?sig=$index',
            fit: BoxFit.cover,
            loadingBuilder: (_, __, ___) => Center(child: SizedBox(width: 30,height: 30,child: CircularProgressIndicator(strokeWidth: 2,))),
          ),
        ),
      );
}
