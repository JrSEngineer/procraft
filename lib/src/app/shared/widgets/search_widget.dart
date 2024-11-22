import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({required this.onChanged, super.key});

  final Function(String?) onChanged;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Container(
      height: height * 0.032,
      width: width,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(4)),
      child: TextFormField(
        textAlignVertical: TextAlignVertical.bottom,
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
