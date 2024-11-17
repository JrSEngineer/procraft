import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.034,
      width: width,
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        showCursor: false,
        decoration: const InputDecoration(
          isDense: true,
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
