// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ListItemWidget extends StatefulWidget {
  const ListItemWidget({Key? key, required this.title, required this.content}) : super(key: key);
  final String title;
  final Widget content;
  @override
  State<ListItemWidget> createState() => _ListItemWidgetState();
}

class _ListItemWidgetState extends State<ListItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 32,
          width: 32,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(2),
            color: Theme.of(context).primaryColor,
          ),
          child: Icon(
            Icons.scatter_plot_outlined,
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          widget.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(),
        widget.content,
      ],
    );
  }
}
