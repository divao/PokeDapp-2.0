import 'package:json_annotation/json_annotation.dart';

part 'type_rm.g.dart';

@JsonSerializable()
class TypeRM {
  TypeRM({
    required this.name,
  });

  @JsonKey(name: 'name')
  final String name;

  factory TypeRM.fromJson(Map<String, dynamic> json) =>
      _$TypeRMFromJson(json);
}