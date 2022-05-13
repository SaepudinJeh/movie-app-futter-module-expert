import 'package:flutter/material.dart';

import '../pages/about_page.dart';
import '../pages/movie/watchlist_movies_page.dart';

class CustomDrawer extends StatefulWidget {
  final Widget content;

  const CustomDrawer({Key? key, required this.content}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  void toggle() => _animationController.isDismissed
      ? _animationController.forward()
      : _animationController.reverse();

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggle,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            double slide = 240.0 * _animationController.value;
            double scale = 1 - (_animationController.value * 0.3);

            return Stack(children: [
              Container(
                child: Column(
                  children: [
                    UserAccountsDrawerHeader(
                      currentAccountPicture: CircleAvatar(
                        backgroundImage: AssetImage('assets/circle-g.png'),
                      ),
                      accountName: Text('Ditonton'),
                      accountEmail: Text('ditonton@dicoding.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.movie_filter_outlined),
                      title: Text('Movies'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.live_tv_rounded),
                      title: Text('Watching TV'),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.save_alt_rounded),
                      title: Text('Watchlist Movie'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, WatchlistMoviesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.save_alt_rounded),
                      title: Text('Watchlist TV'),
                      onTap: () {
                        Navigator.pushNamed(
                            context, WatchlistMoviesPage.ROUTE_NAME);
                      },
                    ),
                    ListTile(
                      onTap: () {
                        Navigator.pushNamed(context, AboutPage.ROUTE_NAME);
                      },
                      leading: Icon(Icons.info_outline_rounded),
                      title: Text('About'),
                    ),
                  ],
                ),
              ),
              Transform(
                transform: Matrix4.identity()
                  ..translate(slide)
                  ..scale(scale),
                alignment: Alignment.centerLeft,
                child: widget.content,
              ),
            ]);
          }),
    );
  }
}
