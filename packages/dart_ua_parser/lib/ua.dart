class UAAstNode {
  UAAstNode({
    required this.product,
    required this.productVersion,
    required this.comment,
  });

  /// Mozilla
  final String product;

  /// 114514
  /// 114.514
  /// 11.4.514
  /// 11.4.5.14
  final List<int>? productVersion;

  final String? comment;

  @override
  String toString() => [
        [product, if (productVersion != null) productVersion!.join('.')].join(),
        if (comment != null) '($comment)',
      ].join(' ');
}
