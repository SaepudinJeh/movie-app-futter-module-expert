import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:movies/presentation/pages/movie_list.dart';
import 'package:movies/presentation/pages/popular_movies_page.dart';
import 'package:movies/presentation/pages/search_page.dart';
import 'package:movies/presentation/pages/top_rated_movies_page.dart';
import 'package:movies/presentation/provider/movie_list_notifier.dart';
import 'package:provider/provider.dart';

import 'package:tv_series/tv_series.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<MovieListNotifier>(context, listen: false)
          ..fetchNowPlayingMovies()
          ..fetchPopularMovies()
          ..fetchTopRatedMovies());

    Future.microtask(() => Provider.of<TVListNotifier>(context, listen: false)
      ..fetchOnTheAirTV()
      ..fetchPopularTV()
      ..fetchTopRatedTV());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ditonton'),
        leading: const Icon(Icons.menu),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Now Playing',
                style: kHeading6,
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.nowPlayingState;
                if (state == RequestState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return MovieList(data.nowPlayingMovies);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.popularMoviesState;
                if (state == RequestState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return MovieList(data.popularMovies);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              Consumer<MovieListNotifier>(builder: (context, data, child) {
                final state = data.topRatedMoviesState;
                if (state == RequestState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return MovieList(data.topRatedMovies);
                } else {
                  return const Text('Failed');
                }
              }),
              const Divider(color: Colors.white, height: 65.0),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  'On The Air TV Series',
                  style: kHeading6,
                ),
              ),
              Consumer<TVListNotifier>(builder: (context, data, child) {
                final state = data.onTheAirTVState;

                if (state == RequestState.Loading) {
                  return const Center(child: const CircularProgressIndicator());
                } else if (state == RequestState.Loaded) {
                  return TVList(data.onTheAirTV);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                  title: 'On Popular TV Series',
                  onTap: () =>
                      Navigator.pushNamed(context, PopularTVPage.ROUTE_NAME)),
              Consumer<TVListNotifier>(builder: (context, data, child) {
                final state = data.onPopularTVState;

                if (state == RequestState.Loading) {
                  return const Center(child: const CircularProgressIndicator());
                } else if (state == RequestState.Loaded) {
                  return TVList(data.onPopularTV);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                  title: 'Top Rated TV Series',
                  onTap: () =>
                      Navigator.pushNamed(context, TopRatedTVPage.ROUTE_NAME)),
              Consumer<TVListNotifier>(builder: (context, data, child) {
                final state = data.topRatedTVState;

                if (state == RequestState.Loading) {
                  return const Center(child: const CircularProgressIndicator());
                } else if (state == RequestState.Loaded) {
                  return TVList(data.topRatedTV);
                } else {
                  return const Text('Failed');
                }
              }),
            ],
          ),
        ),
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}
