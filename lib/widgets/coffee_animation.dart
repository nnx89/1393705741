import 'package:flutter/material.dart';

GlobalKey<_CoffeeScreenState> childKey2 = GlobalKey();

class CoffeeScreen extends StatefulWidget {
  CoffeeScreen({
    required Key key,
  }) : super(key: key);

  @override
  _CoffeeScreenState createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen>
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
    double s = animation.value * 450;

    return SlideTransition(
      position: animationSlide,
      child: Container(
        height: 400,
        width: 400,
        child: ElevatedButton(
          onPressed: () {
            start;
          },
          child: Image.asset(
            'assets/images/coffee.jpg',
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
