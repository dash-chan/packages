// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserAgent {
  UserAgent({
    required this.product,
    required this.version,
    this.comment,
  });
  final String product;
  final String version;
  final List<String>? comment;
}

class UAProduct {
  UAProduct({
    required this.name,
    this.version,
  });
  final String name;
  final String? version;
}

class UAInfo {
  UAInfo({
    required this.data,
  });
  final List<String> data;
}
