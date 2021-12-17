import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app.dart';
import '../../../controllers/controllers.dart';
import '../../../domain/entities/entities.dart';

class DetailsScreen extends GetView<DetailsController> {
  static const String routeName = '/details';

  final String animeId = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: .0,
        backgroundColor: Colors.transparent,
      ),
      body: GetX<DetailsController>(
        initState: (state) async {
          await controller.fetchFullAnimeDetails(animeId);
        },
        builder: (controller) {
          if(controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: [
              SliverPersistentHeader(
                pinned: true,
                delegate: DetailsPersistentHeaderDelegate(
                  animeBanner: controller.anime!.banner,
                  animeName: controller.anime!.name,
                  animeYear: controller.anime!.year,
                  size: MediaQuery.of(context).size,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        child: Wrap(
                          spacing: 4.0,
                          children: controller.anime!.genres.map<Chip>(_buildChipGenres).toList(),
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.play_arrow,
                        ),
                        label: Text(
                          "Assistir",
                        ),
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      _buildInformation(
                        title: "Descrição",
                        info: controller.anime!.description!
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                      ...List.generate(controller.anime!.seasons!.length, (index) => _buildSeasonsList(
                        season: controller.anime!.seasons![index],
                        initiallyExpanded: index == 0,
                      )),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Chip _buildChipGenres(String gen) {
    return Chip(
      elevation: 2.0,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w500,
      ),
      label: Text(gen)
    );
  }

  Widget _buildInformation({
    required String title,
    required String info,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.grey,
            fontSize: 15.0
          ),
        ),
        Text(
          info,
          textAlign: TextAlign.justify,
          style: TextStyle(
            fontSize: 13.0
          ),
        ),
      ],
    );
  }

  Widget _buildSeasonsList({
    required SeasonEntity season,
    required bool initiallyExpanded,
  }) {
    return Builder(
      builder: (context) => ExpansionTile(
        tilePadding: const EdgeInsets.all(.0),
        childrenPadding: const EdgeInsets.all(.0),
        initiallyExpanded: initiallyExpanded,
        title: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(4.0)
                )
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0
              ),
              child: Text(
                '${season.seasonNumber}',
                style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.white
                ),
              ),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              'Temporada',
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
        children: season.episodes.map<Widget>(_buildEpisodePreview).toList(),
      ),
    );
  }

  Widget _buildEpisodePreview(EpisodeEntity episody) {
    return ListTile(
      leading: Image.network(
        episody.previewUrl,
      ),
      title: Text(
        'Episódio ${episody.number}',
      ),
      subtitle: Text(
        episody.date,
      ),
    );
  }
}

class DetailsPersistentHeaderDelegate extends SliverPersistentHeaderDelegate {
  final String animeBanner;
  final String animeName;
  final int animeYear;
  final Size size;

  DetailsPersistentHeaderDelegate({
    required this.size,
    required this.animeBanner,
    required this.animeName,
    required this.animeYear,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                animeBanner,
              ),
            ),
          ),
          child: Container(
            color: Colors.black54,
          ),
        ),
        Positioned(
          bottom: .0,
          left: .0,
          right: .0,
          child: ClipPath(
            clipper: CustomClipPathBorder(),
            child: Material(
              child: Container(
                height: 85,
                padding: EdgeInsets.only(
                  left: 16 + 100,
                ),
                child: ListTile(
                  title:  Text(
                    animeName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  subtitle:  Text(
                    '$animeYear',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: CoverBanner(
            animeImage: animeBanner,
            animeNote: 7.0,
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => size.height * 0.70;

  @override
  double get minExtent => kToolbarHeight + 200;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) => false;
}

class CoverBanner extends StatelessWidget {
  final String animeImage;
  final double animeNote;

  const CoverBanner({
    Key? key,
    required this.animeImage,
    required this.animeNote,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 100,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          image: DecorationImage(
            image: NetworkImage(
              animeImage
            ),
          )
        ),
        child: Container(
          padding: const EdgeInsets.only(
            right: 16.0,
            left: 16.0,
            bottom: 4.0,
          ),
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.transparent,
                Colors.black,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
                size: 18,
              ),
              Text(
                '$animeNote',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      );
  }
}

class CustomClipPathBorder extends CustomClipper<Path> {

  CustomClipPathBorder();

  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(size.width * 0.23, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
