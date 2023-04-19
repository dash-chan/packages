# pattern_dots

A pattern lock UI using flutter.

## USAGE

```dart
bool isError = false;
...
PatternStyle(
  data: PatternStyleData(
    width: 4,
    tapRange: 24,
  ),
  child: PatternView(
    isError: isError,
    onTapDown: () {
      isError = false;
      setState(() {});
    },
    onComplete: (cells) {
      isError = !listEquals(cells, [0, 4, 5, 8]);
      setState(() {});
    },
  ),
);
...
```
