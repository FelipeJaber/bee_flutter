import 'package:bee_flutter/Pages/GymScreen/Ferramentas/GymTracker.dart';
import 'package:bee_flutter/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../HubScreen/HubScreen.dart';

class GymPage extends StatefulWidget {
  GymPage({Key? key}) : super(key: key);

  @override
  _GymPageState createState() {
    return _GymPageState();
  }
}

class _GymPageState extends State<GymPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => GymTracker()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.red,
                    ),
                    height: 200,
                  ),
                ),
              ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
