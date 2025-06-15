import 'package:flutter/widgets.dart';

/// An expandable column widget that supports scrolling while allowing
/// the use of `Expanded` and `Spacer` widgets within its children.
///
/// This widget combines the functionality of a [Column] with scrolling
/// capabilities, making it ideal for layouts that need to expand to fill
/// available space while remaining scrollable when content overflows.
///
/// Example usage:
/// ```dart
/// ExpandableColumn(
///   padding: EdgeInsets.all(16.0),
///   children: [
///     Text('Header'),
///     Expanded(child: Container(color: Colors.blue)),
///     Text('Footer'),
///   ],
/// )
/// ```
class ExpandableColumn extends StatelessWidget {
  /// Creates an expandable column widget.
  ///
  /// The [children] parameter must not be null but can be empty.
  /// All other parameters are optional and have sensible defaults.
  const ExpandableColumn({
    required this.children,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.textDirection,
    this.verticalDirection = VerticalDirection.down,
    this.textBaseline,
    this.padding,
    this.physics,
    this.primary,
    this.reverse = false,
    this.clipBehavior = Clip.hardEdge,
    super.key,
  });

  /// The widgets to display in this column.
  ///
  /// These widgets will be arranged vertically and can include
  /// [Expanded] and [Spacer] widgets.
  final List<Widget> children;

  /// How the children should be placed along the main axis (vertically).
  ///
  /// Defaults to [MainAxisAlignment.start].
  final MainAxisAlignment mainAxisAlignment;

  /// How much space should be occupied in the main axis.
  ///
  /// Defaults to [MainAxisSize.max] to fill all available space.
  final MainAxisSize mainAxisSize;

  /// How the children should be placed along the cross axis (horizontally).
  ///
  /// Defaults to [CrossAxisAlignment.center].
  final CrossAxisAlignment crossAxisAlignment;

  /// Determines the order to lay children out horizontally and how to interpret
  /// start and end in the horizontal direction.
  final TextDirection? textDirection;

  /// Determines the order to lay children out vertically and how to interpret
  /// start and end in the vertical direction.
  ///
  /// Defaults to [VerticalDirection.down].
  final VerticalDirection verticalDirection;

  /// If aligning items according to their baseline, which baseline to use.
  final TextBaseline? textBaseline;

  /// The amount of space to inset the children.
  ///
  /// If null, no padding is applied.
  final EdgeInsetsGeometry? padding;

  /// How the scroll view should respond to user input.
  ///
  /// If null, defaults to [ClampingScrollPhysics] for a more natural
  /// scrolling experience on most platforms.
  final ScrollPhysics? physics;

  /// Whether this is the primary scroll view associated with the parent
  /// [PrimaryScrollController].
  final bool? primary;

  /// Whether the scroll view scrolls in the reading direction.
  ///
  /// Defaults to false (normal scrolling direction).
  final bool reverse;

  /// The content will be clipped (or not) according to this option.
  ///
  /// Defaults to [Clip.hardEdge].
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      crossAxisAlignment: crossAxisAlignment,
      textDirection: textDirection,
      verticalDirection: verticalDirection,
      textBaseline: textBaseline,
      children: children,
    );

    // Apply padding if specified using SliverPadding
    if (padding != null) {
      child = SliverPadding(padding: padding!, sliver: child);
    }

    return CustomScrollView(
      physics: physics ?? const ClampingScrollPhysics(),
      primary: primary,
      reverse: reverse,
      clipBehavior: clipBehavior,
      slivers: [SliverFillRemaining(hasScrollBody: false, child: child)],
    );
  }
}
