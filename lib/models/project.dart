import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    this.id,
    required this.projectName,
    required this.projectDescription,
    required this.category,
    this.categoryDisplay,
    required this.technologiesUsed,
    this.projectLink = '',
    this.starCount = 0,
    this.isStarred = false,
  });

  @JsonKey(includeToJson: false)
  final String? id;

  final String projectName;
  final String projectDescription;
  final String category;

  @JsonKey(includeToJson: false)
  final String? categoryDisplay;

  final String technologiesUsed;

  @JsonKey(defaultValue: '')
  final String projectLink;

  @JsonKey(includeToJson: false, defaultValue: 0)
  final int starCount;

  @JsonKey(includeToJson: false, defaultValue: false)
  final bool isStarred;

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
