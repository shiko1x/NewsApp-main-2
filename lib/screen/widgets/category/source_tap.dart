import 'package:flutter/material.dart';
import 'package:news/core/theme/app_colors.dart';
import 'package:news/data/model/sourcesResponse.dart';
import 'package:news/screen/widgets/news/news_widget.dart';
import 'package:news/screen/widgets/category/source_name.dart';

class SourceTapWidget extends StatefulWidget {
  final List<Sources> listSources;
  const SourceTapWidget({super.key, required this.listSources});

  @override
  State<SourceTapWidget> createState() => _SourceTapWidgetState();
}

class _SourceTapWidgetState extends State<SourceTapWidget> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.listSources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Theme.of(context).splashColor,
            dividerColor: AppColors.transparent,
            isScrollable: true,
            tabAlignment: TabAlignment.start,
            tabs: widget.listSources.map((source) {
              return SourceName(
                sourceName: source,
                isSelected: selectedIndex == widget.listSources.indexOf(source),
              );
            }).toList(),
            onTap: (index) {
              selectedIndex = index;
              setState(() {});
            },
          ),
          Expanded(
            child: NewsWidget(sources: widget.listSources[selectedIndex])
          ),
        ],
      ),
    );
  }
}
