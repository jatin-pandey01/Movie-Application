import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/model.dart';

class MovieDisplay extends StatefulWidget {
  const MovieDisplay({super.key});

  @override
  State<MovieDisplay> createState() => _MovieDisplayState();
}

class _MovieDisplayState extends State<MovieDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            Positioned(
              bottom: 5,
              height: size.height*0.7,
              width: size.width,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 550,
                ),

                items: movies.map((movie) {
                  return Builder(builder: (BuildContext context){
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        height: 350,
                        width: size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Image(image: NetworkImage(movie["Image"])),
                      ),
                    );
                  });
                }).toList() ,

              )
            ),
          ],
        ),
      ),
    );
  }
}