import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int number=0;
  Timer?_timer;
  void _startIncrementing() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        number++;
      });
    });
  }
  void _stopCounting() {
    _timer?.cancel();
  }

  void _startDecrementing() {
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        if (number > 0) number--;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text(
          "Easy Calc",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            //backgroundColor: Colors.redAccent,
          ),
        ),
      ),
      body:
        Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Center(child:Text("$number",
                style: TextStyle(
                  //backgroundColor: Colors.red,
                  fontSize: 150,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ), ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Container(
                    width: 40,
              height: 40,
              decoration: BoxDecoration(
              color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
                    child: GestureDetector(
                      onTap: (){
                        number++;
                        print(number);
                        setState(() {

                        });
                      },
                      onTapDown: (_) => _startIncrementing(),
                      onTapUp: (_) => _stopCounting(),
                      onTapCancel: _stopCounting,


                      child:Icon(Icons.add,
                        color: Colors.white,),

                        ),
                  ),
                  SizedBox(width: 70,),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTap: (){
                        if(number>0){
                        number--;
                        print(number);
                        setState(() {

                        });
                      }},
                      onTapDown: (_) => _startDecrementing(),
                      onTapUp: (_) => _stopCounting(),
                      onTapCancel: _stopCounting,

                      child:Icon(Icons.remove,
                        color: Colors.white,),

                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

    );
  }
}
