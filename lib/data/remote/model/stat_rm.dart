import 'package:json_annotation/json_annotation.dart';

part 'stat_rm.g.dart';

@JsonSerializable()
class StatRM {
  StatRM({
    required this.name,
  });

  @JsonKey(name: 'name')
  final String name;

  factory StatRM.fromJson(Map<String, dynamic> json) =>
      _$StatRMFromJson(json);
}