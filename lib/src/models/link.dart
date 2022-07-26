import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Link {
  Link({
    this.href,
    this.rel,
    this.method,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  final String? href;
  final String? rel;
  final String? method;
}
