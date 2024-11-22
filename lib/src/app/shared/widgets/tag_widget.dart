// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TagWidget extends StatelessWidget {
  TagWidget({
    Key? key,
    this.borderColor = Colors.black,
    this.backgroundColor = Colors.black54,
    this.selectedColor = const Color.fromRGBO(0, 0, 0, 0.541),
    this.selectedTag = false,
    required this.animation,
    this.radius = 48,
    this.horizontalPadding = 16,
    this.verticalPadding = 4,
    this.label = '',
    this.onTagSelect,
  }) : super(key: key);

  final Color borderColor;
  final Color backgroundColor;
  final Color selectedColor;
  bool selectedTag;
  ValueListenable animation;
  final double radius;
  final double horizontalPadding;
  final double verticalPadding;
  final String label;
  final Function()? onTagSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(48),
      onTap: selectedTag ? null : onTagSelect,
      child: AnimatedBuilder(
        animation: animation,
        builder: (_, __) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: selectedTag ? selectedColor : backgroundColor,
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
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
