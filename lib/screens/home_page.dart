import 'package:carousel_slider/carousel_slider.dart';
import 'package:example/screens/home_page_yest.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:text_scroll/text_scroll.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController textController = TextEditingController();
  Color rang = Colors.blue;
  String text =
      "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
  List nom1 = [];
  List nom2 = [];

  int s1 = 0;
  int s2 = 0;
  Color a = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Correct write words"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            child: TextFormField(
              onChanged: (v) {
                nom1 = textController.text.split("");
                nom2 = text.split("");
                setState(() {
                  for (var i = 0; i < 1; i++) {
                    for (var i = 0; i < nom1.length; i++) {
                      if (nom1[i] != nom2[i]) {
                        s1 += 1;
                        Future.delayed(Duration(seconds: 1)).then((value) {
                          setState(() {
                            a = Colors.red;
                          });
                        }).then((value) {
                          Future.delayed(Duration(seconds: 3)).then((value) {
                            setState(() {
                              a = Colors.green;
                            });
                          });
                        });
                      }
                    }
                    s2 = s1;
                    s1 = 0;
                  }
                });
              },
              controller: textController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Column(
            children: [
              TextScroll(
                text,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: rang,
                ),
                velocity: Velocity(
                  pixelsPerSecond: Offset(50, 0),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08,
          ),
          Container(
            color: a,
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 1,
            child: Center(
              child: Text("$s2 xato"),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => HomePageYest(),
                ),
              );
            },
            child: Text("NEXT GAME CLICK HERE"),
          ),
        ],
      ),
    );
  }
}
