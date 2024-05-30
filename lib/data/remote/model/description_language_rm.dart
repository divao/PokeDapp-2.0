import 'package:json_annotation/json_annotation.dart';

part 'description_language_rm.g.dart';

@JsonSerializable()
class DescriptionLanguageRM {
  DescriptionLanguageRM({
    required this.name,
  });

  @JsonKey(name: 'name')
  final String name;

  factory DescriptionLanguageRM.fromJson(Map<String, dynamic> json) =>
      _$DescriptionLanguageRMFromJson(json);
}