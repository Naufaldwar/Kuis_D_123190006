import 'package:flutter/material.dart';
import 'package:kuis/app_store.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AppDetail extends StatelessWidget {
  final AppStore detailApp;
  const AppDetail({Key? key, required this.detailApp}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(detailApp.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      detailApp.imageLogo,
                      height: 105,
                      width: 105,
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Wrap(
                              direction: Axis.vertical,
                              spacing: 8, // <-- Spacing between children
                              children: <Widget>[
                                Text(detailApp.name,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(detailApp.developer,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(detailApp.genre,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black.withOpacity(0.6))),
                                Wrap(
                                    direction: Axis.horizontal,
                                    spacing: 8,
                                    children: [
                                      Text(detailApp.rating,
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.black
                                                  .withOpacity(0.6))),
                                    ]),
                              ],
                            )
                          ]))
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  scrollDirection: Axis.horizontal,
                ),
                items: detailApp.imageUrls.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        child: Image.network(image),
                      );
                    },
                  );
                }).toList(),
              ),
              Text(detailApp.description,
                  style: TextStyle(
                    fontSize: 16,
                  )),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // _launchURL(detailApp.appLink);
                    },
                    child: Text('Download'),
                  )),
            ],
          ),
        ));
  }
}
