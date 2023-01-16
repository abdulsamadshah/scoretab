import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("About Us"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
        child: Column(
           crossAxisAlignment:CrossAxisAlignment.start ,
          children: const [
            SizedBox(height: 10,),
            Text("We love sports. To play and to watch. We enjoy the emotional roller-coaster it takes us through. Sports by nature of it leads us into the unknown which gets us excited about things to come."
            ,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
             SizedBox(height: 15,),
             Text("There are instances where we miss watching some milestones or rivalries unfold in real time just because we forgot to watch it LIVE or we were not aware of the schedule.",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
            SizedBox(height: 15,),
             Text("Whether it is Racquet Sports, Ball Sports, Track & Field or Motorsports, let us support all our sporting heroes.",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), ),
            SizedBox(height: 15,),
             Text("ScoreTab works to provide online service of multiple sports in a single platform and to create a technology platform connecting India to the world of sports. ",
            style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400), )
          ],
        ),
      )
    );
  }
}
