import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:whos_here/friend/widgets/chips_animation.dart';
import 'package:whos_here/friend/widgets/coffee_animation.dart';
import 'package:whos_here/friend/widgets/heart_animation.dart';
import 'package:whos_here/friend/widgets/like_animation.dart';
import 'package:whos_here/friend/widgets/milktea_animation.dart';
import 'package:whos_here/friend/widgets/rose_animation.dart';

class gridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 4,
        padding: const EdgeInsets.all(40),
        scrollDirection: Axis.vertical,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        children: [
          Stack(
            children: [
              ChipScreen(key: childKey1),
              ElevatedButton(
                onPressed: () {
                  childKey1.currentState?.start();
                },
                child: Image.asset('assets/images/chips.jpg', width: 60, height: 60,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
          Stack(
            children: [
              CoffeeScreen(key: childKey2),
              ElevatedButton(
                onPressed: () {
                  childKey2.currentState?.start();
                },
                child: Image.asset('assets/images/coffee.jpg', width: 50, height: 50,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
          Stack(
            children: [
              HeartScreen(key: childKey3),
              ElevatedButton(
                onPressed: () {
                  childKey3.currentState?.start();
                },
                child: Image.asset('assets/images/heart.jpg', width: 50, height: 50,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
          Stack(
            children: [
              LikeScreen(key: childKey4),
              ElevatedButton(
                onPressed: () {
                  childKey4.currentState?.start();
                },
                child: Image.asset('assets/images/like.jpg', width: 50, height: 50,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
          Stack(
            children: [
              MilkteaScreen(key: childKey5),
              ElevatedButton(
                onPressed: () {
                  childKey5.currentState?.start();
                },
                child: Image.asset('assets/images/milktea.jpg', width: 70, height: 70,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
          Stack(
            children: [
              RoseScreen(key: childKey6),
              ElevatedButton(
                onPressed: () {
                  childKey6.currentState?.start();
                },
                child: Image.asset('assets/images/rose.jpg', width: 50, height: 50,),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.transparent),
                  shadowColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ],
            alignment: Alignment.center,
          ),
        ]);
  }

}