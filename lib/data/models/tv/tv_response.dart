import 'package:ditonton/data/models/tv/tv_model.dart';
import 'package:equatable/equatable.dart';

class TVResponse extends Equatable {
  final List<TVModel> tvlist;

  TVResponse({required this.tvlist});

  factory TVResponse.fromJson(Map<String, dynamic> json) => TVResponse(
          tvlist: List<TVModel>.from(
        (json['result'] as List)
            .map((x) => TVModel.fromJson(x))
            .where((element) => element.posterPath != null),
      ));

  Map<String, dynamic> toJson() =>
      {"results": List<dynamic>.from(tvlist.map((x) => x.toJson()))};

  @override
  List<Object?> get props => [tvlist];
}
