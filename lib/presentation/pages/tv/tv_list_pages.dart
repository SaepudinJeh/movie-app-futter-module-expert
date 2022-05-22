import 'package:cached_network_image/cached_network_image.dart';
import 'package:commons/commons.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/presentation/pages/tv/tv_detail_pages.dart';
import 'package:flutter/material.dart';

class TVList extends StatelessWidget {
  final List<TV> tvList;

  TVList(this.tvList);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final tv = tvList[index];
            return Container(
              padding: const EdgeInsets.all(8),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, TVDetailPage.ROUTE_NAME,
                      arguments: tv.id);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  child: CachedNetworkImage(
                    imageUrl: '$BASE_IMAGE_URL${tv.posterPath}',
                    placeholder: (context, url) => Center(
                      child: CircularProgressIndicator(),
                    ),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
              ),
            );
          },
          itemCount: tvList.length),
    );
  }
}
