import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app.dart';
import '../../mixins/mixins.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends GetView with StatusBarManager {
  static const String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    showStatusBar();

    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Text(
              "AnimaFlix"
            ),
            centerTitle: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    AppImages.allAnimes,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black54
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 16.0, right: 16.0, left: 16.0, bottom: 8.0),
            sliver: SliverToBoxAdapter(
              child: Text(
                "Animes",
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            sliver: SliverGrid.count(
              crossAxisCount: MediaQuery.of(context).orientation == Orientation.portrait
                ? 2
                : 3,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
              children: [
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
                AnimeBanner(name: "One Piece", urlImage: 'https://wallpaperaccess.com/full/10817.jpg'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
