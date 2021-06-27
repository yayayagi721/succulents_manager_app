import 'package:flutter/material.dart';

class SettingListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _settingHeader(),
      body: _settingBody(),
    );
  }

  PreferredSizeWidget _settingHeader() {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(Icons.settings),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.add),
        ),
      ],
      title: Text(
        'ホーム',
      ),
      backgroundColor: Colors.black87,
      centerTitle: true,
      elevation: 0.0,
    );
  }

  Widget _settingBody() {
    return Container();
  }
}
