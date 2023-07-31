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

### easy way to customize style

* unselectCellStyles 未选择的样式
* selectCellStyles 已选择的样式
  * CircleGen 圆形
  * ShapeGen 自定义shape
* lineStyle 线条的样式

```dart
PatternStyle(
  data: PatternStyleData.compose(
    tapRange: 24,
    unselectCellStyles: [
      CircleGen(
          radius: 16,
          color: Colors.blue[100]!,
          style: PaintingStyle.fill),
    ],
    selectCellStyles: [
      CircleGen(
          radius: 16,
          color: Colors.blue[100]!,
          style: PaintingStyle.fill),
      CircleGen(
          radius: 8, color: Colors.blue, style: PaintingStyle.fill),
    ],
    lineStyle: [
      RangeLineStyleGen(
        color: Colors.pink.withOpacity(0.2),
        width: 12,
      ),
    ],
  ),
  child: PatternView(
    lockStyle: _lockStyle,
    matrixY: 4,
    onTapDown: () {},
    onComplete: (cells) {},
  ),
);
```
