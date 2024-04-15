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
  int selectedColor=0;
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
                        SizedBox(height: 10,),
                        SizedBox(
                          height: 70,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: time.length,
                            itemBuilder: (context,index){
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = index; 
                                  });
                                },
                                child: FadeInUp(
                                  delay: Duration(milliseconds: index*100),
                                  child: AnimatedContainer(
                                    height: 60,
                                    width: 60,
                                    duration: Duration(milliseconds: 400),
                                    margin: EdgeInsets.only(right: 10),
                                    decoration: BoxDecoration(
                                      color: selectedColor == index ? colors[index] : colors[index].withOpacity(0.5),
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        width: selectedColor == index ? 3.0:0, 
                                        color: selectedColor == index ? Colors.blue : Colors.transparent
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        time[index],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: selectedColor == index ? Colors.white : Colors.black54,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  )
                                ),
                              );
                            }
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 140, vertical: 15),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text("Check Out", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        
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