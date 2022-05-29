import 'package:flutter/widgets.dart';

/// Expandable Flutter column that supports scrolling and allows the use of `Expanded` and `Spacer` widgets.
class ExpandableColumn extends StatelessWidget {
  /// {@macro expandable_column}
  ///
  /// Creates a scrollable and expandable column.
  ///
  /// The [children] argument must not be null.
  const ExpandableColumn({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    Key? key,
  }) : super(key: key);

  /// The widgets to display in this column.
  final List<Widget> children;

  /// How the children should be placed along the main axis.
  final MainAxisAlignment mainAxisAlignment;

  /// How the children should be placed along the cross axis.
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      /// Instead of ListView or SingleChildScrollView put CustomScrollVIew
      /// to use Expanded or spacer
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: mainAxisAlignment,
            crossAxisAlignment: crossAxisAlignment,
            children: children,
          ),
        ),
      ],
    );
  }
}
