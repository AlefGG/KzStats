import 'package:json_annotation/json_annotation.dart';
part 'vk_response_items_comments.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Comments {
  final int canPost;
  final int Count;
  final bool groupsCanPost;

  Comments(this.canPost, this.Count, this.groupsCanPost);

  factory Comments.fromJson(Map<String, dynamic> json) =>
      _$CommentsFromJson(json);

  Map<String, dynamic> toJson() => _$CommentsToJson(this);
}
