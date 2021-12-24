import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation/api/api_repo.dart';

import 'animations/fade_animation.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert' as convert;
import 'screens/home_page.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: DeliveryFood(),
    );
  }
}

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color.fromRGBO(244, 243, 243, 1),
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: IconButton(
//           icon: Icon(
//             Icons.menu,
//             color: Colors.black87,
//           ),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius:
//                     BorderRadius.vertical(bottom: Radius.circular(30)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Find Your",
//                     style: TextStyle(color: Colors.black87, fontSize: 25),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     "Inspiration",
//                     style: TextStyle(color: Colors.black, fontSize: 40),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     padding: EdgeInsets.all(5),
//                     decoration: BoxDecoration(
//                         color: Color.fromRGBO(244, 243, 243, 1),
//                         borderRadius: BorderRadius.circular(15)),
//                     child: TextField(
//                       decoration: InputDecoration(
//                           border: InputBorder.none,
//                           prefixIcon: Icon(
//                             Icons.search,
//                             color: Colors.black87,
//                           ),
//                           hintText: "Search you re looking for",
//                           hintStyle:
//                               TextStyle(color: Colors.grey, fontSize: 16)),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 20.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Promo Today",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
//                   ),
//                   SizedBox(
//                     height: 15,
//                   ),
//                   Container(
//                     height: 200,
//                     child: ListView(
//                       scrollDirection: Axis.horizontal,
//                       children: [
//                         promoCard("assets/images/one.jpg"),
//                         promoCard("assets/images/two.jpg"),
//                         promoCard("assets/images/three.jpg"),
//                         promoCard("assets/images/four.jpg"),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     height: 150,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(20),
//                       image: DecorationImage(
//                           image: AssetImage("assets/images/three.jpg"),
//                           fit: BoxFit.cover),
//                     ),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           gradient: LinearGradient(
//                               begin: Alignment.bottomRight,
//                               stops: [
//                                 .3,
//                                 .9
//                               ],
//                               colors: [
//                                 Colors.black.withOpacity(.8),
//                                 Colors.black.withOpacity(.2),
//                               ])),
//                       child: Align(
//                         alignment: Alignment.bottomLeft,
//                         child: Padding(
//                           padding: const EdgeInsets.all(20.0),
//                           child: Text(
//                             "Best Design",
//                             style: TextStyle(color: Colors.white, fontSize: 20),
//                           ),
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget promoCard(String image) {
//     return AspectRatio(
//       aspectRatio: 2.67 / 3,
//       child: Container(
//         margin: EdgeInsets.only(right: 8),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//           image: DecorationImage(image: AssetImage(image), fit: BoxFit.cover),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(20),
//               gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
//                 .1,
//                 .85
//               ], colors: [
//                 Colors.black.withOpacity(.7),
//                 Colors.black.withOpacity(.1),
//               ])),
//         ),
//       ),
//     );
//   }
// }

class DeliveryFood extends StatefulWidget {
  @override
  _DeliveryFoodState createState() => _DeliveryFoodState();
}

class _DeliveryFoodState extends State<DeliveryFood>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 100));

    _animation =
        Tween<double>(begin: 1.0, end: 25.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((f) => Navigator.push(context,
        PageTransition(type: PageTransitionType.fade, child: HomePage()))).then((value) => setState(() {
      _textVisible = true;
    }) );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/starter-image.jpg"),
              fit: BoxFit.cover),
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.7),
              Colors.black.withOpacity(.2),
            ],
          )),
          child: Padding(
            padding:  EdgeInsets.all(20.0),
            child: FutureBuilder(
              future: ApiLogic.getAllPosts(),
              builder: (context,snapShot){
                if(snapShot.hasData){
                  return  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeAnimation(
                        delay: .5,
                        child: Text(
                          "Taking Order For Delivery",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 50,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      FadeAnimation(
                        delay: 1,
                        child: Text(
                          "See resturants nearby \n adding location",
                          style: TextStyle(
                              color: Colors.white, height: 1.4, fontSize: 18),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      FadeAnimation(
                        delay: 1.2,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: LinearGradient(
                                colors: [Colors.yellow, Colors.orange]),
                          ),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: _onTap,
                              minWidth: double.infinity,
                              child: Text(
                                "Start",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      FadeAnimation(
                        delay: 1.4,
                        child: AnimatedOpacity(
                          opacity: _textVisible ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 50),
                          child: Align(
                            child: Text(
                              "Now Delivery To Your Door 24/7",
                              style: TextStyle(color: Colors.white70),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                }else{
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
      ),
    );
  }
  Future<void> testApi(List<String> arguments) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url =
    Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
      convert.jsonDecode(response.body) as Map<String, dynamic>;
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
