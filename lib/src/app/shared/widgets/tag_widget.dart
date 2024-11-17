// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  const TagWidget({
    Key? key,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.black54,
    this.radius = 48,
    this.horizontalPadding = 16,
    this.verticalPadding = 4,
    this.label = '',
  }) : super(key: key);

  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double horizontalPadding;
  final double verticalPadding;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
