import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController=PageController(initialPage: 0,);
  int pageChanged=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PageView"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
            setState(() {
              pageController.animateToPage(--pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
            });
          },),
          IconButton(icon: Icon(Icons.arrow_forward_ios),onPressed: (){
            setState(() {
              pageController.animateToPage(++pageChanged, duration: Duration(milliseconds: 250), curve: Curves.bounceIn);
            });
          },),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
                      child: PageView(
              onPageChanged: (value){
                setState(() {
                  pageChanged=value;
                });
              },
              controller: pageController,
              scrollDirection: Axis.horizontal,
             // pageSnapping:
               //   false, // It give MI UI type swiping where you can swipe to anothe half page while holding the finger on the screen . By default it is true
              children: <Widget>[
                Container(
                  color: Colors.purple,
                ),
                Container(
                  color: Colors.red,
                ),
                Container(
                  color: Colors.pink,
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(child: Center(child: Text("A EXPANDED CONTAINER!!!!!!"),),),
          ),
        ],
      ),
    );
  }
}
