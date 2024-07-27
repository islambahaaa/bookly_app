import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'image_links.g.dart';

@HiveType(typeId: 2)
class ImageLinks extends Equatable {
  final String? smallThumbnail;
  @HiveField(0)
  final String thumbnail;

  const ImageLinks({this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json['smallThumbnail'] as String,
        thumbnail: json['thumbnail'] as String,
      );

  Map<String, dynamic> toJson() => {
        'smallThumbnail': smallThumbnail,
        'thumbnail': thumbnail,
      };

  @override
  List<Object?> get props => [smallThumbnail, thumbnail];
}
