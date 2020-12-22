import 'package:employee_record/main.dart';
import 'package:employee_record/roscos/roscos.dart';
import 'package:employee_record/spacex/spacex.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget horizontalList2 = new Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 180.0,
        child: new ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Container(
              width: 10,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                width: 160.0,
                child: Image.asset('assets/nasa.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen1()));
              },
              child: Container(
                width: 160.0,
                child: Image.asset('assets/spacex.png'),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen2()));
              },
              child: Container(
                width: 160.0,
                child: Image.asset('assets/rs.png'),
              ),
            ),
          ],
        ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              left: -65,
              top: -50,
              child: Column(
                children: [
                  Container(
                    width: 500,
                    child: CircleAvatar(
                      backgroundImage: ExactAssetImage('assets/background.jpg'),
                      minRadius: 90,
                      maxRadius: 180,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
                left: -180,
                top: 590,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                        width: 100,
                        child: Center(
                            child: Text('Sweeden',
                                style: TextStyle(color: Colors.white))),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: new LinearGradient(
                            colors: [Colors.red, Colors.blue],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 205,
                            ),
                            Text(
                              'Sweeden to study Venus &\nspace',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 45,
                            ),
                            Image.asset(
                              "assets/venus.jpg",
                              height: 80,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 100,
                        child: Center(
                            child: Text('Starlink',
                                style: TextStyle(color: Colors.white))),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          gradient: new LinearGradient(
                            colors: [Colors.orange, Colors.red],
                            begin: FractionalOffset.centerLeft,
                            end: FractionalOffset.centerRight,
                          ),
                        ),
                      ),
                      Container(
                        height: 70,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 205,
                            ),
                            Text(
                              'Next starlink test flight\nscheduled in March',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            Image.asset(
                              "assets/starlink.jpg",
                              height: 70,
                              width: 100,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Positioned(
                left: 30,
                top: 250,
                child: Container(
                  child: Center(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        hintStyle: TextStyle(
                          fontSize: 18.5,
                        ),
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromRGBO(250, 250, 250, 0.95),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  height: 65,
                  width: 320,
                )),
            Container(
              child: ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  SizedBox(
                    height: 300,
                  ),
                  Text(
                    "  Top Picks For You",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(17, 34, 63, 1)),
                  ),
                  horizontalList2,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
