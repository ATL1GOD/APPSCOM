import 'package:flutter/material.dart';
import 'package:appscom/src/screens/carousel/news_item.dart';
import 'package:appscom/src/screens/carousel/news_app_bar.dart';
import 'package:appscom/src/screens/carousel/news_details.dart';

class NewsDetailsPage extends StatelessWidget {
  final int index;
  const NewsDetailsPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: CustomScrollView(
              slivers: [
                NewsDetailsAppBar(
                  index: index,
                ),
                SliverToBoxAdapter(
                  child: NewsDetailsBody(
                    newsItem: news[index],
                  ),
                ),
                // SliverPadding(
                //     padding: EdgeInsets.only(bottom: 1000)),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: SizedBox(
              width: size.width,
              height: size.height * 0.1,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
