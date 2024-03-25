import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HubPage extends StatefulWidget {
  HubPage({Key? key}) : super(key: key);

  @override
  _HubPageState createState() {
    return _HubPageState();
  }
}

class _HubPageState extends State<HubPage> {
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
    return Container(
      color: Colors.blue,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ],
        ),
      ),
    );
  }
}
