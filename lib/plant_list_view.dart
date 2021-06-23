import 'package:flutter/material.dart';

class PlantListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _blankSpace(),
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
      margin: EdgeInsets.only(top: 25, left: 25, right: 25),
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
        height: 120,
        decoration: BoxDecoration(
          color: Color.fromRGBO(207, 230, 193, 1),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(top: 3, left: 3, right: 3, bottom: 9),
        child: _cardBody(name, botanicalName, moisture, soilAgeOfDay,
            Image.asset('sample_images/testImage.jpeg')));
  }

  Widget _cardBody(String name, String botanicalName, double moisture,
      int soilAgeOfDay, Image plantImage) {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(top: 6, left: 6, right: 6),
              child: Container(
                decoration: BoxDecoration(
                  // color: Color.fromRGBO(207, 230, 193, 1),
                  color: Color.fromRGBO(255, 212, 137, 1),
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
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
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
            )),
        Expanded(
            flex: 1,
            child: Center(
              child: Container(
                  width: double.infinity,
                  child: Row(
                    children: [
                      _stateBar(Icons.opacity, "18%"),
                      _stateBar(Icons.terrain, "57日")
                    ],
                  )),
            )),
      ],
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
