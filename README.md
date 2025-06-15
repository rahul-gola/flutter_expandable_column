# Flutter Expandable Column

An expandable Flutter column widget that supports scrolling while allowing the use of `Expanded` and
`Spacer` widgets within its children. Perfect for responsive layouts that need to fill available
space while remaining scrollable when content overflows.

## Features

- ✅ Supports `Expanded` and `Spacer` widgets
- ✅ Scrollable when content overflows
- ✅ Customizable padding, alignment, and scroll behavior
- ✅ All standard Column properties supported
- ✅ Lightweight and performant

## Usage

### Basic Example

```dart
ExpandableColumn(
  children: [
    Text('Header'),
    Expanded(
      child: Container(
        color: Colors.blue,
        child: Center(child: Text('Expanded Content')),
      ),
    ),
    Text('Footer'),
  ],
)
```

### With Padding and Custom Alignment

```dart
ExpandableColumn(
  padding: EdgeInsets.all(16.0),
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    Card(child: Padding(padding: EdgeInsets.all(8), child: Text('Top Card'))),
    Spacer(),
    Card(child: Padding(padding: EdgeInsets.all(8), child: Text('Bottom Card'))),
  ],
)
```

### With Custom Scroll Physics

```dart
ExpandableColumn(
  physics: BouncingScrollPhysics(),
  children: [
    // Your widgets here
  ],
)
```

## API Reference

All parameters from the standard `Column` widget are supported, plus additional scroll and padding
options:

- `children`: List of widgets to display
- `padding`: Optional padding around the column
- `physics`: Scroll physics (defaults to ClampingScrollPhysics)
- `reverse`: Whether to reverse the scroll direction
- `primary`: Whether this is the primary scroll controller
- All standard Column properties: `mainAxisAlignment`, `crossAxisAlignment`, `mainAxisSize`, etc.

## License

This project is licensed under the MIT License.
