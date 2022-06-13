import 'package:flutter/material.dart';

class reuseContainer extends StatelessWidget {
  const reuseContainer(this.colour, {this.containerChild, this.onPress});

  final Color colour;
  final Widget? containerChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
          child: containerChild,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color:  colour,
              borderRadius: BorderRadius.circular(10)
          )),
    );
  }
}

