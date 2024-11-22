// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:procraft/src/app/modules/processes/view/stores/process_store.dart';
import 'package:procraft/src/app/shared/widgets/tag_widget.dart';

class ProcessesTagsWidget extends StatelessWidget {
  const ProcessesTagsWidget({Key? key, required this.store}) : super(key: key);

  final ProcessStore store;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    final tagsSpacingValue = width * 0.032;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Icon(Icons.filter_list),
        Row(
          children: [
            TagWidget(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: const Color(0xffF7F7F8),
              selectedColor: const Color(0xffD3C8D8),
              label: "Todos",
              verticalPadding: 8,
              selectedTag: store.overalTagSelected.value,
              animation: store.overalTagSelected,
              onTagSelect: store.selectOveralTag,
            ),
            SizedBox(width: tagsSpacingValue),
            TagWidget(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: const Color(0xffF7F7F8),
              selectedColor: const Color(0xffD3C8D8),
              label: "Em Andamento",
              verticalPadding: 8,
              selectedTag: store.startedProcessTagSelected.value,
              animation: store.startedProcessTagSelected,
              onTagSelect: store.selectStartedProcessesTag,
            ),
            SizedBox(width: tagsSpacingValue),
            TagWidget(
              borderColor: Theme.of(context).primaryColor,
              backgroundColor: const Color(0xffF7F7F8),
              selectedColor: const Color(0xffD3C8D8),
              label: "Finalizados",
              verticalPadding: 8,
              selectedTag: store.finishedProcessSelected.value,
              onTagSelect: store.selectFinishedProcessesTag,
              animation: store.finishedProcessSelected,
            ),
          ],
        ),
      ],
    );
  }
}
