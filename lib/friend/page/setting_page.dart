import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class setting_page extends StatelessWidget {
  const setting_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Share Contact",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 5.0,),
                  Icon(Icons.share,),
                ],
              ),
            )),
        Divider(
          height: 10.0,
        ),
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Mute",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 5.0,),
                  Icon(Icons.volume_mute_sharp,),
                ],
              ),
            )),
        Divider(
          height: 10.0,
        ),
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Visibility Off",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 5.0,),
                  Icon(Icons.visibility_off,)
                ],
              ),
            )),
        Divider(height: 10.0,),
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Report Problem",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 5.0,),
                  Icon(Icons.report_problem,),
                ],
              ),
            )),
        Divider(height: 10.0,),
        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Delete Friend",
                      style: TextStyle(color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      )),
                  SizedBox(width: 5.0,),
                  Icon(Icons.delete, color: Colors.red,)
                ],
              ),
            )),
        Divider(height: 10.0,),

        Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Text("Cancel",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  )),
            ))
      ],
    );
  }
}
