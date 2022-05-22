import 'package:equatable/equatable.dart';
import 'package:tv_series/domain/entities/genre_tv.dart';

class GenreTVModel extends Equatable {
  const GenreTVModel({
    required this.id,
    required this.name,
  });

  final int id;
  final String name;

  factory GenreTVModel.fromJson(Map<String, dynamic> json) => GenreTVModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  GenreTv toEntity() {
    return GenreTv(id: this.id, name: this.name);
  }

  @override
  List<Object?> get props => [id, name];
}
