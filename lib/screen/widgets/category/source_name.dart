import 'package:flutter/material.dart';
import 'package:news/data/model/sourcesResponse.dart';

class SourceName extends StatelessWidget {
  final Sources sourceName;
  final bool isSelected;
  const SourceName({
    super.key,
    required this.sourceName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      sourceName.name ?? "",
      style: isSelected
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.bodySmall,
    );
  }
}
