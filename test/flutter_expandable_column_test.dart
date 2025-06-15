import 'package:flutter/material.dart';
import 'package:flutter_expandable_column/flutter_expandable_column.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ExpandableColumn', () {
    testWidgets('creates widget with required children parameter', (
      tester,
    ) async {
      const widget = ExpandableColumn(
        children: [
          Text('Test'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      expect(find.text('Test'), findsOneWidget);
      expect(find.byType(CustomScrollView), findsOneWidget);
      expect(find.byType(SliverFillRemaining), findsOneWidget);
    });

    testWidgets('works with Expanded widgets', (tester) async {
      final widget = ExpandableColumn(
        children: [
          const Text('Header'),
          Expanded(
            child: Container(
              color: Colors.blue,
              child: const Text('Expanded'),
            ),
          ),
          const Text('Footer'),
        ],
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      expect(find.text('Header'), findsOneWidget);
      expect(find.text('Expanded'), findsOneWidget);
      expect(find.text('Footer'), findsOneWidget);
      expect(find.byType(Expanded), findsOneWidget);
    });

    testWidgets('works with Spacer widgets', (tester) async {
      const widget = ExpandableColumn(
        children: [
          Text('Top'),
          Spacer(),
          Text('Bottom'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      expect(find.text('Top'), findsOneWidget);
      expect(find.text('Bottom'), findsOneWidget);
      expect(find.byType(Spacer), findsOneWidget);
    });

    testWidgets('applies custom alignment properties', (tester) async {
      const widget = ExpandableColumn(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Test'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      final column = tester.widget<Column>(find.byType(Column));
      expect(column.mainAxisAlignment, MainAxisAlignment.center);
      expect(column.crossAxisAlignment, CrossAxisAlignment.stretch);
    });

    testWidgets('applies custom scroll physics', (tester) async {
      const widget = ExpandableColumn(
        physics: NeverScrollableScrollPhysics(),
        children: [
          Text('Test'),
        ],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      final customScrollView = tester.widget<CustomScrollView>(
        find.byType(CustomScrollView),
      );
      expect(customScrollView.physics, isA<NeverScrollableScrollPhysics>());
    });

    testWidgets('handles empty children list', (tester) async {
      const widget = ExpandableColumn(
        children: [],
      );

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: widget,
          ),
        ),
      );

      expect(find.byType(CustomScrollView), findsOneWidget);
      final column = tester.widget<Column>(find.byType(Column));
      expect(column.children, isEmpty);
    });
  });
}
