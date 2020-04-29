import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:page_transition/page_transition.dart';
import 'FadeAnimation.dart';
import 'Second_screen.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class SplashDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashDemo();
  }
}

class _SplashDemo extends State<SplashDemo> with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  bool hideIcon = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                hideIcon = true;
              });
              _scale2Controller.forward();
            }
          });

    _scale2Controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 50.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
//              context,
//              PageTransition(
//                  type: PageTransitionType.fade, child: LoginPage()));
            }
          });
  }

//  @override
//  void initState() {
//    super.initState();
//    const duration = Duration(milliseconds: 7000);
//    Timer(duration, () {
//      Navigator.of(context).pop();
//      Navigator.push(
//          context, MaterialPageRoute(builder: (context) => SecondScreen()));
//    });
//  }

  @override
  Widget build(BuildContext context) {
//    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.white,
          width: 1,
        )),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(
                10,
              ),
            ),
            Image.asset(
              'images/ieee_branch.png',
              height: 400.0,
              width: 500.0,
            ),
//            Padding(
//              padding: EdgeInsets.only(
//                top: 10,
//              ),
//            ),
            ColorizeAnimatedTextKit(
                text: ['    IEEE-AZHAR', 'Student Branch'],
                textStyle: TextStyle(
                  fontSize: 35,

//                color: Colors.indigo.shade900,
                  fontFamily: "Ewert",
                ),
                colors: [
                  Colors.purple,
                  Colors.blue,
                  Colors.yellow,
                  Colors.red,
                ],
                textAlign: TextAlign.start,
                alignment: AlignmentDirectional.topStart),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
              ),
            ),
            SizedBox(
              height: 1,
            ),
            FadeAnimation(
                1.6,
                AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Center(
                        child: AnimatedBuilder(
                          animation: _widthController,
                          builder: (context, child) => Container(
                            width: _widthAnimation.value,
                            height: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue.withOpacity(.4)),
                            child: InkWell(
                              onTap: () {
                                _scaleController.forward();
                              },
                              child: Stack(children: <Widget>[
                                AnimatedBuilder(
                                  animation: _positionController,
                                  builder: (context, child) => Positioned(
                                    left: _positionAnimation.value,
                                    child: AnimatedBuilder(
                                      animation: _scale2Controller,
                                      builder: (context, child) =>
                                          Transform.scale(
                                              scale: _scale2Animation.value,
                                              child: Container(
                                                width: 60,
                                                height: 60,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: Colors.cyanAccent),
                                                child: hideIcon == false
                                                    ? Icon(
                                                        Icons.arrow_forward,
                                                        color: Colors.white,
                                                      )
                                                    : Container(),
                                              )),
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        ),
                      )),
                )),
          ],
        ),
      ),
    );
  }
}

//import 'dart:async';
//import 'package:flutter/cupertino.dart';
//
//import 'Second_screen.dart';
//import 'package:flutter/material.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//
//class SplashDemo extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return _SplashDemo();
//  }
//}
//
//class _SplashDemo extends State<SplashDemo> {
//  @override
//  void initState() {
//    super.initState();
//    const duration = Duration(milliseconds: 7000);
//    Timer(duration, () {
////      Navigator.of(context).pop();
////      Navigator.push(
////          context, MaterialPageRoute(builder: (context) => SecondScreen()));
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: Colors.black,
//      body: Container(
//        decoration: BoxDecoration(
//            border: Border.all(
//              color: Colors.white,
//              width: 1,
//            )),
//        height: MediaQuery.of(context).size.height,
//        width: MediaQuery.of(context).size.width,
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            Padding(
//              padding: EdgeInsets.all(
//                10,
//              ),
//            ),
//            Image.asset(
//              'images/ieee_branch.png',
//              height: 400.0,
//              width: 500.0,
//            ),
////            Padding(
////              padding: EdgeInsets.only(
////                top: 10,
////              ),
////            ),
//            ColorizeAnimatedTextKit(
//                text: ['IEEE-ALAZHAR', 'Student Branch'],
//                textStyle: TextStyle(
//                  fontSize: 30,
//
////                color: Colors.indigo.shade900,
//                  fontFamily: "Ewert",
//                ),
//                colors: [
//                  Colors.purple,
//                  Colors.blue,
//                  Colors.yellow,
//                  Colors.red,
//                ],
//                textAlign: TextAlign.start,
//                alignment: AlignmentDirectional.topStart),
//            Padding(
//              padding: EdgeInsets.only(
//                top: 50,
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
