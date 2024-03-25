import 'package:bee_flutter/Pages/GymScreen/GymPage.dart';
import 'package:bee_flutter/Pages/HubScreen/HubPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HubScreen extends StatefulWidget {
  HubScreen({Key? key}) : super(key: key);

  @override
  _HubScreenState createState() {
    return _HubScreenState();
  }
}

class _HubScreenState extends State<HubScreen> {
  bool isExpanded = true;
  int selectedItem = 0;
  PageController pageController = PageController();
  bool showMenuIcon = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void changePage(int index) {
    setState(() {
      selectedItem = index;
      pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                width: isExpanded ? 250 : 0,
                child: Column(
                  children: [
                    //Area da logo
                    Container(
                      height: 150,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isExpanded = !isExpanded;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 200,
                      child: Divider(
                        color: Colors.black,
                      ),
                    ),
                    menuItem(0, "Hub"),
                    menuItem(1, "PH01"),
                    menuItem(2, "PH02"),
                    menuItem(3, "PH03"),
                    menuItem(4, "PH04"),
                    menuItem(5, "PH05"),
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    HubPage(),
                    GymPage(),
                    Container(color: Colors.red),
                    Container(color: Colors.purple),
                    Container(color: Colors.grey),
                    Container(color: Colors.black54),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: !isExpanded
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedContainer(
                      width: isExpanded ? 0 : 50,
                      height: isExpanded ? 0 : 50,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                      duration: Duration(milliseconds: 1000),
                      child: Icon(Icons.menu),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }

  Widget menuItem(int index, String tema) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changePage(index);
        });
      },
      child: Container(
        width: 250,
        color: Colors.red.withOpacity(0),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 100),
                height: selectedItem == index ? 30 : 0,
                width: 2,
                color: Colors.black,
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      tema,
                      style: TextStyle(
                          fontSize: 36,
                          color: selectedItem == index
                              ? Colors.black
                              : Colors.grey[600],
                          fontWeight: selectedItem == index
                              ? FontWeight.w400
                              : FontWeight.normal),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
