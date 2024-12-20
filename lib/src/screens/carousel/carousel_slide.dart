import 'package:carousel_slider/carousel_slider.dart'; // Paquete oficial
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:appscom/src/screens/carousel/news_item.dart';
import 'package:appscom/src/screens/carousel/news_details_page.dart';

// Renombramos el widget para evitar conflictos con el paquete oficial
class NewsCarouselSlider extends StatefulWidget {
  const NewsCarouselSlider({super.key});

  @override
  State<NewsCarouselSlider> createState() => _NewsCarouselSliderState();
}

class _NewsCarouselSliderState extends State<NewsCarouselSlider> {
  final CarouselSliderController _controller = CarouselSliderController();
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> imageSliders = news.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      return InkWell(
        onTap: () {
          Navigator.of(context, rootNavigator: true).push(
            CupertinoPageRoute(
              builder: (_) => NewsDetailsPage(index: index),
            ),
          );
        },
        
        child: Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(24.0)),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  item.imgAssets,
                  fit: BoxFit.cover,
                  width: 1000.0,
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        item.category,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          '${item.author} • ${item.time}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(200, 0, 0, 0),
                              Color.fromARGB(0, 0, 0, 0)
                            ],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 20.0),
                        child: Text(
                          item.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }).toList();

    return Column(
      children: [
        CarouselSlider(
          items: imageSliders,
          carouselController: _controller,
          options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: news.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(entry.key);
              },
              child: Container(
                width: _current == entry.key ? 25.0 : 12.0,
                height: 12.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                  borderRadius: _current == entry.key
                      ? BorderRadius.circular(8.0)
                      : null,
                  shape: _current == entry.key
                      ? BoxShape.rectangle
                      : BoxShape.circle,
                  color: _current == entry.key
                      ? Colors.blue
                      : Colors.grey.withOpacity(0.3),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}




