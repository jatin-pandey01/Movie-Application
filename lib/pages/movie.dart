import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:movie_app/utils/model.dart';
import 'package:movie_app/pages/details_screen.dart';

class MovieDisplay extends StatefulWidget {
  const MovieDisplay({super.key});

  @override
  State<MovieDisplay> createState() => _MovieDisplayState();
}

int currentIndex = 0;

class _MovieDisplayState extends State<MovieDisplay> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Stack(
          children: [
            
            //For background
            Image(image: NetworkImage(movies[currentIndex]['Image']), fit: BoxFit.cover,),

            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: size.height*0.33,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade50.withOpacity(1),
                      Colors.grey.shade100.withOpacity(1),
                      Colors.grey.shade100.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                      Colors.grey.shade100.withOpacity(0),
                    ]
                  ),
                ),
              )
            ),

            Positioned(
              bottom: 5,
              height: size.height*0.7,
              width: size.width,
              child: CarouselSlider(

                options: CarouselOptions(
                  height: 550,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),

                items: movies.map((movie) {
                  return Builder(builder: (BuildContext context){
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(currentIndex: currentIndex)
                          ),
                        );
                        
                      },
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                  height: 350,
                                  width: size.width*0.55,
                                  margin: EdgeInsets.only(top: 20),
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Image(image: NetworkImage(movie["Image"])),
                                ),
                                SizedBox(height: 20,),
                      
                                //For movie title
                                Text(movie['Title'], style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      
                                SizedBox(height: 10,),
                      
                                //For movie director
                                Text(movie["Director"], style: TextStyle(fontSize: 16,color: Colors.black45),),
                      
                                SizedBox(height: 20,),
                      
                                //For Rating and Duration
                                AnimatedOpacity(
                                  opacity: currentIndex == movies.indexOf(movie) ? 1.0 : 0,
                                  duration: Duration(milliseconds: 1000),
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 18),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.star,color: Colors.amber,size: 20,),
                                            const SizedBox(width: 5,),
                                            Text(movie['Rating'], style: const TextStyle(fontSize: 16),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons.access_alarm, size: 20,color: Colors.black54,),
                                            SizedBox(width: 5,),
                                            Text(movie['Duration'], style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black54
                                            ),)
                                          ],
                                        ),
                                        SizedBox(
                                          width: size.width*0.21,
                                          child: Row(
                                            children: [
                                              Icon(Icons.play_circle,size: 20,color: Colors.black54,),
                                              SizedBox(width: 5,),
                                              Text("Watch",style: TextStyle(fontSize: 16,color: Colors.black54),)
                                            ],
                                          ),
                                        )
                                        
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
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