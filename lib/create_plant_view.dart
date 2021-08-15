import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'clipper.dart';

class CreatePlantView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _returnButton(context),
          Column(children: <Widget>[_top(context), _content(context)])
        ],
      ),
    );
  }

  Widget _top(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 2,
      child: ClipPath(
        clipper: ArcClipper(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            Center(
              child: SizedBox(
                  height: 50, width: 50, child: Container(color: Colors.red)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _content(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Flexible(
      flex: 5,
      child: ListView(
        children: [
          Container(
            height: 600,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(30),
            ),
          )
        ],
      ),
    );
  }

  Widget _returnButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40,
        left: 10,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context, true);
        },
        icon: Icon(
          Icons.arrow_back,
          size: 30,
        ),
        color: Colors.black45,
      ),
    );
  }
}
