import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portfolio project synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    this.id,
    required this.title,
    required this.description,
    required this.techStack,
    required this.projectUrl,
    this.projectImageUrl = '',
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  /// UUID assigned by the server. Never sent in request bodies because
  /// Django generates it.
  @JsonKey(includeToJson: false)
  final String? id;

  final String title;

  final String description;

  final String techStack;

  final String projectUrl;

  /// Optional image URL. Defaults to an empty string when the API omits it
  /// or returns null.
  @JsonKey(defaultValue: '')
  final String projectImageUrl;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
