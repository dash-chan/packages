# pattern_dots

A pattern lock UI using flutter.

## USAGE

```dart
PatternLockStyle _lockStyle = PatternLockStyle.normal;
...
PatternStyle(
  data: PatternStyleData(
    width: 4,
    tapRange: 24,
  ),
  child: PatternView(
    lockStyle: _lockStyle,
    onTapDown: () {
      _lockStyle = PatternLockStyle.normal;
      setState(() {});
    },
    onComplete: (cells) {
      bool same = listEquals(cells, [0, 4, 5, 8]);
      _lockStyle = same ? PatternLockStyle.success : PatternLockStyle.failed;
      setState(() {});
    },
  ),
);
...
```
