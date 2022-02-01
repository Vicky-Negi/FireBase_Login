import 'package:loginprac/Pages/splash_screen.dart';
import 'package:flutter/material.dart';
class VideoCard extends StatelessWidget {
  final String profno;
  final String thumno;
  final String title;
  final String desc;
  const VideoCard({required this.profno, required this.title,required this.desc,required this.thumno});

  @override
  Widget build(BuildContext context) {
    return
          Column(
            children: [
              Stack(
                children: [
                  Image(image: AssetImage("assest/videos/$thumno..jpg")),
                  Positioned(bottom: 8.0,
                      right: 8.0,
                      child: Container(
                        color: Colors.black54,
                        padding: const EdgeInsets.all(4.0),
                          child: Text("8:00",

                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white)),
                      )
                  )
                ],
              ),
              SizedBox(height: 8,),
              Container(
                height:30,
                child: Row(
                  children: [
                    CircleAvatar(backgroundImage: AssetImage("assest/ProfilePic/$profno.png")),
                    SizedBox(width:8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(child: Text(title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14.0),)),
                          SizedBox(height:3),
                          Flexible( child: Text(desc,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 12.0),
                          )),
                        ],
                      ),
                    ),
                    Icon(Icons.more_vert)
                  ],
                ),
              ),
              SizedBox(height: 10,)
            ],
          );
  }
}
