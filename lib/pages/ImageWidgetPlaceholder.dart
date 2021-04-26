import 'package:flutter/material.dart';



// https://medium.com/flutter/improving-perceived-performance-with-image-placeholders-precaching-and-disabled-navigation-6b3601087a2b
class ImageWidgetPlaceholder extends StatelessWidget {
  const ImageWidgetPlaceholder({
    Key key,
    this.image,
    this.placeholder,
  }) : super(key: key);
  final ImageProvider image;
  final Widget placeholder;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: image,
      ///loadingBuilder: (context, ),
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (wasSynchronouslyLoaded) {
          return child;
        } else {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            child: frame != null ? child : placeholder,
          );
        }
      },
    );
  }
}