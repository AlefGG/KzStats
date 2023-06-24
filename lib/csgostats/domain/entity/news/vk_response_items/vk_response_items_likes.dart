import 'package:json_annotation/json_annotation.dart';
part 'vk_response_items_likes.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Likes {
  final int canLike;
  final int count;
  final int userLikes;
  final int canPublish;
  final bool repostDisabled;

  Likes(this.canLike, this.count, this.userLikes, this.canPublish,
      this.repostDisabled);

  factory Likes.fromJson(Map<String, dynamic> json) => _$LikesFromJson(json);

  Map<String, dynamic> toJson() => _$LikesToJson(this);
}
