import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/tv/tv.dart';
import 'package:ditonton/domain/entities/tv/tv_detail.dart';
import 'package:ditonton/presentation/provider/tv/tv_detail_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class TVDetailPage extends StatefulWidget {
  static const ROUTE_NAME = '/detail-tv';

  final int id;

  const TVDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  State<TVDetailPage> createState() => _TVDetailPageState();
}

class _TVDetailPageState extends State<TVDetailPage> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<TVDetailNotifier>(context, listen: false)
          .fetchTVDetail(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<TVDetailNotifier>(builder: (context, provider, child) {
        if (provider.tVDetailState == RequestState.Loading) {
          return Center(child: CircularProgressIndicator());
        } else if (provider.tVDetailState == RequestState.Loaded) {
          return SafeArea(
              child: DetailContentTVDetail(
            tvDetail: provider.tVDetail,
            recommendation: provider.tvRecommendation,
          ));
        } else {
          return Text(provider.message);
        }
      }),
    );
  }
}

class DetailContentTVDetail extends StatelessWidget {
  final TvDetail tvDetail;
  final List<TV> recommendation;

  const DetailContentTVDetail(
      {Key? key, required this.recommendation, required this.tvDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: 'https://image.tmdb.org/t/p/w500${tvDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: BoxDecoration(
                    color: kRichBlack,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16))),
                padding:
                    const EdgeInsets.only(left: 16.0, top: 16.0, right: 16.0),
                child: Stack(children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16.0),
                    child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tvDetail.name,
                              style: kHeading5,
                            ),
                            ElevatedButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [Icon(Icons.add), Text("Wathlist")],
                                )),
                            Text(_showGenres(tvDetail.genres)),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: tvDetail.voteAvarage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) =>
                                      Icon(Icons.star, color: kMikadoYellow),
                                  itemSize: 24,
                                ),
                                Text('${tvDetail.voteAvarage}')
                              ],
                            ),
                            SizedBox(height: 16.0),
                            Text("Overview", style: kHeading6),
                            Text(tvDetail.overview),
                            SizedBox(height: 16.0),
                            Text('Recommendation', style: kHeading6),
                            Consumer<TVDetailNotifier>(
                                builder: (context, data, child) {
                              if (data.tvRecommendationState ==
                                  RequestState.Loading) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (data.tvRecommendationState ==
                                  RequestState.Error) {
                                return Center(child: Text(data.message));
                              } else if (data.tvRecommendationState ==
                                  RequestState.Loaded) {
                                return Container(
                                    height: 150.0,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        final tvRecommendation =
                                            recommendation[index];

                                        return Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.pushReplacementNamed(
                                                  context,
                                                  TVDetailPage.ROUTE_NAME,
                                                  arguments:
                                                      tvRecommendation.id);
                                            },
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(8)),
                                              child: CachedNetworkImage(
                                                  imageUrl:
                                                      'https://image.tmdb.org/t/p/w500${tvRecommendation.posterPath}',
                                                  placeholder: (context, url) =>
                                                      Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(Icons.error)),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: recommendation.length,
                                    ));
                              } else {
                                return Container();
                              }
                            })
                          ],
                        )),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      color: Colors.white,
                      height: 4.0,
                      width: 48.0,
                    ),
                  )
                ]),
              );
            },
            minChildSize: 0.25,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ],
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ", ";
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
