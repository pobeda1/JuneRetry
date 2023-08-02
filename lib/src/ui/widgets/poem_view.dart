import 'package:flutter/material.dart';
import 'package:text_field_glasnie/src/models/poem_model.dart';

class PoemView extends StatefulWidget {
  const PoemView({super.key, required this.poem});
  final PoemModel poem;

  @override
  State<PoemView> createState() => _PoemViewState();
}

class _PoemViewState extends State<PoemView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(50),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border.fromBorderSide(BorderSide()),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(12, 10, 10, 1),
          child: Text(
            widget.poem.text,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
      ),
    );
  }
}
