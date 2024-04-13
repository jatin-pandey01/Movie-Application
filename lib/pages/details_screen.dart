import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/pages/movie.dart';
import 'package:movie_app/utils/model.dart';

class DetailScreen extends StatefulWidget {
  final int currentIndex;
  const DetailScreen({super.key, required this.currentIndex});
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height*0.61,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: [
                StretchMode.zoomBackground,
              ],
              background: Hero(
                tag: movies[currentIndex]["Title"],
                transitionOnUserGestures: true,
                child: Image(image: NetworkImage(movies[currentIndex]["Image"]), fit: BoxFit.cover,)),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(40), 
              child: FadeInUp(
                duration: Duration(milliseconds: 500),
                child: Transform.translate(
                  offset: Offset(0, 1),
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                      )
                    ),
                    child: Center(
                      child: Container(
                        width: 65,
                        height: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black12
                        ),
                      ),
                    ),
                  ),
                )
              )
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                FadeInUp(
                  duration: Duration(milliseconds: 500),
                  child: Container(
                    height: size.height*0.85,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeInUp(
                                  child: Text(
                                    movies[currentIndex]["Title"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )
                                ),
                                FadeInUp(
                                  delay: Duration(milliseconds: 100),
                                  child: Text(
                                    movies[currentIndex]["Director"],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black54,
                                    ),
                                  )
                                ),
                              ],
                            ),
                            FadeInUp(
                              child: Text(
                                "Ticket: \u{20B9}${movies[currentIndex]["Price"]}.00",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        FadeInUp(
                          delay: Duration(milliseconds: 300),
                          child: Text(
                            "${movies[currentIndex]["Desc"]}",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade700
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        FadeInUp(
                          delay: Duration(milliseconds: 300),
                          child: Text(
                            "Movies Shows Time",
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            )
          ),
        ],
      ),
    );
  }
}