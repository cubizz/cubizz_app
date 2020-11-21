part of '../index.dart';

class CustomGridView extends StatelessWidget {
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final int crossAxisCount;
  final List<Widget> children;

  const CustomGridView(
      {Key key,
      this.crossAxisSpacing = 0,
      this.mainAxisSpacing = 0,
      this.crossAxisCount,
      this.children})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];

    for (var i = 0; i < children.length / crossAxisCount; i++) {
      final endIndex = i * crossAxisCount + crossAxisCount;
      final List<Widget> items = children.sublist(
          i * crossAxisCount, endIndex > children.length ? null : endIndex);

      if (items.length < crossAxisCount) {
        items.addAll(
          List.generate(
            crossAxisCount - items.length,
            (i) => const SizedBox.shrink(),
          ),
        );
      }

      rows.add(IntrinsicHeight(
        child: Row(
          children: items
              .asMap()
              .map((i, e) => MapEntry<int, Widget>(
                  i,
                  Expanded(
                      child: Padding(
                        child: e,
                        padding: EdgeInsets.only(
                            left: i == 0 ? 0 : crossAxisSpacing),
                      ),
                      flex: 1)))
              .values
              .toList(),
        ),
      ));
    }

    return Column(
      children: rows
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Padding(
                padding: EdgeInsets.only(top: i == 0 ? 0 : mainAxisSpacing),
                child: e,
              )))
          .values
          .toList(),
    );
  }
}
