import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'dart:math';

// ignore: use_key_in_widget_constructors
class PlantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _blankSpace(),
          Padding(
            padding: const EdgeInsets.only(
              top: 35,
              right: 15,
            ),
            child: CircularMenu(
              toggleButtonSize: 30.0,
              radius: 70,
              toggleButtonBoxShadow: [
                BoxShadow(),
              ],
              alignment: Alignment.topRight,
              curve: Curves.easeIn,
              startingAngleInRadian: 0.6 * pi,
              endingAngleInRadian: 9.0 * pi,
              toggleButtonColor: Color.fromRGBO(125, 179, 92, 1),
              items: [
                CircularMenuItem(
                    boxShadow: [
                      BoxShadow(),
                    ],
                    icon: Icons.settings_rounded,
                    color: Colors.purple,
                    onTap: () {}),
                CircularMenuItem(boxShadow: [
                  BoxShadow(),
                ], icon: Icons.opacity, color: Colors.brown, onTap: () {})
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        color: Color.fromRGBO(207, 230, 193, 1),
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                color: Colors.black,
                onPressed: () {},
              ),
              Container(width: 64),
              IconButton(
                icon: Icon(Icons.search),
                color: Colors.black,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {},
              backgroundColor: Color.fromRGBO(125, 179, 92, 1)),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _blankSpace() {
    return Container(
      margin: EdgeInsets.only(top: 55, left: 25, right: 25),
      child: _list(),
    );
  }

  Widget _list() {
    return ListView(
        children: ([
      _menuItem("hoge", "huga", 0.1, 50),
      _menuItem("hoge", "huga", 0.1, 50),
      _menuItem("hoge", "huga", 0.1, 50),
      _menuItem("hoge", "huga", 0.1, 50),
      _menuItem("hoge", "huga", 0.1, 50),
    ]));
  }

  Widget _menuItem(
      String name, String botanicalName, double moisture, int soilAgeOfDay) {
    return Container(
        clipBehavior: Clip.antiAlias,
        height: 120,
        decoration: BoxDecoration(
          color: Color.fromRGBO(218, 180, 153, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 3, left: 3, right: 3, bottom: 9),
        child: Stack(
          children: [
            WaterParameter(
              waterAmountPer: 1,
            ),
            Positioned(
                child: _cardBody(name, botanicalName, moisture, soilAgeOfDay,
                    Image.asset('sample_images/testImage.jpeg'))),
          ],
        ));
  }

  Widget _cardBody(String name, String botanicalName, double moisture,
      int soilAgeOfDay, Image plantImage) {
    return Column(
      children: <Widget>[
        Expanded(flex: 3, child: _mainArea(plantImage)),
        Expanded(flex: 1, child: _indicatorArea()),
      ],
    );
  }

  Widget _mainArea(Image plantImage) {
    return Padding(
      padding: EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          // color: Color.fromRGBO(207, 230, 193, 1),
          color: Color.fromRGBO(207, 230, 193, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: plantImage,
                )),
            Expanded(
              flex: 7,
              child: Container(
                width: double.infinity,
                child: Padding(
                  padding: EdgeInsets.only(top: 25, left: 10),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text("hoge",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "hoge",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicatorArea() {
    return Center(
      child: Container(
          width: double.infinity,
          child: Row(
            children: [
              _stateBar(Icons.opacity, "18%"),
              _stateBar(Icons.terrain, "57日")
            ],
          )),
    );
  }

  Widget _stateBar(IconData icon, String text) {
    return Expanded(
        child: Row(
      children: [
        SizedBox(width: 20),
        Icon(icon),
        SizedBox(width: 5),
        Text(
          text,
        )
      ],
    ));
  }

  // List<Widget> _cardList(List<Widget> cards) {
  //   List<Widget> rows = [];
  //   List<Widget> tmp = [];
  //   cards.forEach((card) {
  //     tmp.add(card);
  //     if (tmp.length == 2) {
  //       rows.add(Row(
  //         children: [Expanded(child: tmp[0]), Expanded(child: tmp[1])],
  //       ));
  //       tmp = [];
  //     }
  //   });
  //   if (tmp != 0) {
  //     rows.add(Row(
  //       children: [Expanded(child: tmp[0]), Expanded(child: Container())],
  //     ));
  //   }
  //   return rows;
  // }
}

class WaterParameter extends StatefulWidget {
  final double? waterAmountPer;

  WaterParameter({this.waterAmountPer});

  @override
  _WaterParameterState createState() => _WaterParameterState();
}

class _WaterParameterState extends State<WaterParameter> {
  Size? size;
  final GlobalKey _targetKey = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) => getSizeAndPosition());

    super.initState();
  }

  getSizeAndPosition() {
    if (_targetKey.currentContext != null) {
      size = _targetKey.currentContext!.size;
    } else {
      size = Size(100, 100);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: size!.height * widget.waterAmountPer!,
        key: _targetKey,
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          color: Color.fromRGBO(150, 216, 224, 1),
        ),
      ),
    );
  }
}
