import 'package:flutter/material.dart';
import 'package:trip_ui/fade_in.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  var totalPage = 4;

  void _onScroll() {
    print("scrolled");
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    )..addListener(() {
        _onScroll();
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
      children: [
        makePage(
            page: 1,
            image: "assets/images/one.jpg",
            title: "Place 1",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the past, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
        makePage(
            page: 2,
            image: "assets/images/two.jpg",
            title: "Place 2",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the past, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
        makePage(
            page: 3,
            image: "assets/images/three.jpg",
            title: "Place 3",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the past, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
        makePage(
            page: 4,
            image: "assets/images/four.jpg",
            title: "Place 4",
            description:
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the past, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "),
      ],
    ));
  }

  Widget makePage({page, image, title, description}) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
          0.3,
          0.9
        ], colors: [
          Colors.black.withOpacity(.9),
          Colors.black.withOpacity(.2)
        ])),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(page.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 25)),
                  Text("/" + totalPage.toString(),
                      style: TextStyle(color: Colors.white, fontSize: 15))
                ],
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeIn(
                    delay: 1,
                    child: Text(
                      title,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 13,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 5.0),
                        child: Icon(
                          Icons.star,
                          color: Colors.grey,
                          size: 13,
                        ),
                      ),
                      Text(
                        "4.0",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      Text(" (1300)", style: TextStyle(color: Colors.grey))
                    ],
                  ),
                  SizedBox(height: 10),
                  Text(description,
                      style: TextStyle(
                          color: Colors.white.withOpacity(.8),
                          fontSize: 15,
                          letterSpacing: 1,
                          height: 1.4)),
                  SizedBox(height: 10),
                  Text("READ MORE", style: TextStyle(color: Colors.white)),
                  SizedBox(height: 30)
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
