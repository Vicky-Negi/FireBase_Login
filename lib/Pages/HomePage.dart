import 'package:loginprac/Data.dart';
import 'package:loginprac/Categry.dart';
import 'package:loginprac/Pages/App_bar.dart';
import 'package:flutter/material.dart';
import 'package:loginprac/VideoCard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        AppBars(),
        SliverToBoxAdapter(
            child: Container(
              height: 40.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctgry.length,
                itemBuilder: (context, index1) {
                  return Center(
                      child: Categry(ctgry[index1].category, ctgry[index1].isExp));
                },
              ),
            )),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return VideoCard(
                    profno: videos[index].profno,
                    title: videos[index].title,
                    desc: videos[index].desc,
                    thumno: videos[index].thumno);
              },
              childCount: videos.length,
            ))
      ]),
    );
  }
}
/*
          (child: Center(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  children: [
                    SizedBox(height: 3),
                    Container(
                      height: 30,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            child: Row(children: <Widget>[
                              Icon(Icons.explore),
                              SizedBox(width: 3),
                              Text( "Explore")
                            ],
                            ),
                          ),
                          SizedBox(width:2),
                          Divider(
                            color: Colors.black54,
                            height: 50,
                            thickness: 5,
                          ),
                          Category(text: "All"),
                          Category(text: "Gaming"),
                          Category(text: "Keegan Micheal key"),
                          Category(text: "Elden Ring"),
                          Category(text: "Chords"),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Expanded(child: ListView(
                        scrollDirection: Axis.vertical,
                        children:<Widget>  [
                          VideoCard(profno: "1", title: "Dhindora | EP 01: Lag Gayi | BB Ki Vines", desc: "BB Ki Vines·50M views·1 month ago", thumno: "1"),
                          VideoCard(profno: "3", title: "JUJUTSU KAISEN 0 Movie - Official Trailer | English Sub", desc: "AnimeUS·1M views·2 weeks ago", thumno: "2"),
                          VideoCard(profno: "2", title: "OneRepublic - If I Lose Myself (Official Music Video)", desc: "OneRepublic·99M views·8 years ago", thumno: "3"),
                          VideoCard(profno: "4", title: "The Joker And The Queen Guitar Tutorial Ed Sheeran ", desc: "GuitarZero2Hero·4.9K views·1 days ago", thumno: "4"),
                        ]
                    )
                    )
                  ]
              )
          )
      ),
      ),
*/
