import 'package:flutter/material.dart';

GlobalKey<_MilkteaScreenState> childKey5 = GlobalKey();

class MilkteaScreen extends StatefulWidget {
  MilkteaScreen({
    required Key key,
  }) : super(key: key);

  @override
  _MilkteaScreenState createState() => _MilkteaScreenState();
}

class _MilkteaScreenState extends State<MilkteaScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late Animation<Offset> animationSlide;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: Duration(seconds: 1), vsync: this); //AnimationController

    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);

    animationSlide = Tween(begin: Offset(0, 0), end: Offset(0.3, -0.7))
        .animate(CurvedAnimation(parent: controller, curve: Curves.ease));
  }

  void start() {
    controller.forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.value = 0;
      } else if (status == AnimationStatus.dismissed) {
        controller.value = 0;
      }
    });

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    double s = animation.value * 650;

    return SlideTransition(
      position: animationSlide,
      child: Container(
        height: 650,
        width: 650,
        child: ElevatedButton(
          onPressed: () {
            start;
          },
          child: Image.asset(
            'assets/images/milktea.jpg',
            width: s,
            height: s,
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
        ),
      ),
    );
  }
}
