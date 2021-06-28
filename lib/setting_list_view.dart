import 'package:flutter/material.dart';

class SettingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _settingHeader(context),
      body: _settingBody(),
    );
  }

  PreferredSizeWidget _settingHeader(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.black45,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      ],
      title: Text('設定',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black45)),
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget _settingBody() {
    return ListView(
      children: [_parentColumn(), _childColumn()],
    );
  }

  Widget _parentColumn() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.black12,
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
                  child: Container(
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text("TEST",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black45)),
              ],
            ),
          )))
        ],
      ),
    );
  }

  Widget _childColumn() {
    return Container(
      decoration: BoxDecoration(
          border: const Border(
              bottom: const BorderSide(
        color: Colors.black12,
        width: 1,
      ))),
      height: 70,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          children: [
            Expanded(
                child: Container(
                    child: Container(
              child: Row(
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  Text("TEST",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black)),
                ],
              ),
            ))),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.black45,
            ),
            SizedBox(
              width: 5,
            )
          ],
        ),
      ),
    );
  }
}
