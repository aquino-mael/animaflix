import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../cross_cutting/bindings/bindings.dart';
import '../screens/details/details_screen.dart';

class AnimeBanner extends StatelessWidget {
  final String animeId;
  final String animeName;
  final int animeYear;
  final double animeRate;
  final String animeUrlImageBanner;

  const AnimeBanner({
    Key? key,
    required this.animeId,
    required this.animeName,
    required this.animeYear,
    required this.animeRate,
    required this.animeUrlImageBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailsScreen(
            animeId: animeId,
          ),
          binding: DetailsBinding(),
        );
      },
      child: Card(
        color: Colors.transparent,
        margin: const EdgeInsets.all(.0),
        elevation: .0,
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      animeUrlImageBanner,
                    ),
                  ),
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            SizedBox(
              height: 4.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  animeName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.5
                  ),
                ),
                SizedBox(
                  height: 4.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        "$animeYear",
                      ),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.yellow,
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Text(
                          "$animeRate",
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
