import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class PostModel extends Equatable {
  const PostModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.body,
  });

  final int id;
  final int userId;
  final String title;
  final String body;

  @override
  List<Object?> get props => [id, userId, title, body];

  factory PostModel.fromJson(Map<dynamic, dynamic> json) => PostModel(
        id: json["id"],
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
      );

  Map<dynamic, dynamic> toJson() =>
      {"id": id, "userId": userId, "title": title, "body": body};

  PostModel copyWith({
    int? id,
    int? userId,
    String? body,
    String? title,
  }) {
    return PostModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
