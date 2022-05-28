import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/movies.dart';

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
    context.read<NowPlayingMovieBloc>().add(FetchNowPlayingMovies());
    context.read<PopularMoviesBloc>().add(FetchPopularMovies());
    context.read<TopRatedMoviesBloc>().add(FetchTopRatedMovies());
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
              BlocBuilder<NowPlayingMovieBloc, NowPlayingMovieState>(
                  builder: (context, state) {
                if (state is NowPlayingMovieLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is NowPlayingMoviesHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Popular',
                onTap: () =>
                    Navigator.pushNamed(context, PopularMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
                  builder: (context, state) {
                if (state is PopularMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is PopularMoviesHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              _buildSubHeading(
                title: 'Top Rated',
                onTap: () =>
                    Navigator.pushNamed(context, TopRatedMoviesPage.ROUTE_NAME),
              ),
              BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
                  builder: (context, state) {
                if (state is TopRatedMoviesLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is TopRatedMoviesHasData) {
                  return MovieList(state.result);
                } else {
                  return const Text('Failed');
                }
              }),
              // const Divider(color: Colors.white, height: 65.0),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0),
              //   child: Text(
              //     'On The Air TV Series',
              //     style: kHeading6,
              //   ),
              // ),
              // Consumer<TVListNotifier>(builder: (context, data, child) {
              //   final state = data.onTheAirTVState;

              //   if (state == RequestState.Loading) {
              //     return const Center(child: const CircularProgressIndicator());
              //   } else if (state == RequestState.Loaded) {
              //     return TVList(data.onTheAirTV);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              // _buildSubHeading(
              //     title: 'On Popular TV Series',
              //     onTap: () =>
              //         Navigator.pushNamed(context, PopularTVPage.ROUTE_NAME)),
              // Consumer<TVListNotifier>(builder: (context, data, child) {
              //   final state = data.onPopularTVState;

              //   if (state == RequestState.Loading) {
              //     return const Center(child: const CircularProgressIndicator());
              //   } else if (state == RequestState.Loaded) {
              //     return TVList(data.onPopularTV);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
              // _buildSubHeading(
              //     title: 'Top Rated TV Series',
              //     onTap: () =>
              //         Navigator.pushNamed(context, TopRatedTVPage.ROUTE_NAME)),
              // Consumer<TVListNotifier>(builder: (context, data, child) {
              //   final state = data.topRatedTVState;

              //   if (state == RequestState.Loading) {
              //     return const Center(child: const CircularProgressIndicator());
              //   } else if (state == RequestState.Loaded) {
              //     return TVList(data.topRatedTV);
              //   } else {
              //     return const Text('Failed');
              //   }
              // }),
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
