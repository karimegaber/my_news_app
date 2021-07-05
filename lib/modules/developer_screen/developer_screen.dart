import 'package:flutter/material.dart';
import 'package:my_news_app/shared/components/components.dart';

class DeveloperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Developer Image
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 2,
                color: Colors.cyan,
              ),
              image: DecorationImage(
                image: AssetImage('assets/images/developer_pic.jpeg'),
              ),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          //Developer Name
          Text(
            'Karim E. Gaber',
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 10,
          ),

          contactInformation(
            mainColor: Colors.green,
            socialName: 'W',
            socialColor: Colors.greenAccent,
            infoColor: Colors.greenAccent,
            infoText: '+201030782412',
          ),

          SizedBox(
            height: 10,
          ),

          contactInformation(
            mainColor: Colors.blueAccent,
            socialName: 'F',
            socialColor: Colors.greenAccent,
            infoColor: Colors.blue,
            infoText: 'Karim E. Gaber',
          ),
        ],
      ),
    );
  }
}
