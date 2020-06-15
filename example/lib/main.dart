import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nine_grid_view/nine_grid_view.dart';
import 'package:nine_grid_view_example/drag_sort_page.dart';
import 'package:nine_grid_view_example/models.dart';
import 'package:nine_grid_view_example/single_picture_page.dart';
import 'package:nine_grid_view_example/utils.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _title = 'WeChat Group';
  NineGridType _gridType = NineGridType.weChatGp;

  List<ImageBean> imageList = List();

  @override
  void initState() {
    super.initState();
    imageList = Utils.getTestData();
  }

  Widget _buildItem(BuildContext context, int _index) {
    int itemCount = _index % 9 + 1;
    if (_gridType == NineGridType.normal ||
        _gridType == NineGridType.weiBo ||
        _gridType == NineGridType.weChat) {
      return Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
        padding: EdgeInsets.all(0),
        child: NineGridView(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(5),
          space: 5,
          type: _gridType,
          color: Color(0XFFE5E5E5),
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            ImageBean bean = imageList[index];
            return Utils.getWidget(bean.middlePath);
          },
        ),
      );
    }
    itemCount = (_index % (_gridType == NineGridType.dingTalkGp ? 4 : 9) + 1);
    Decoration decoration = BoxDecoration(
      color: Color(0XFFE5E5E5),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.all(Radius.circular(4)),
    );
    Widget header = NineGridView(
      width: 120,
      height: 120,
      padding: EdgeInsets.all(2),
      alignment: Alignment.center,
      space: 2,
      type: _gridType,
      decoration: _gridType == NineGridType.weChatGp ? decoration : null,
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        ImageBean bean = imageList[index];
        return Utils.getWidget(bean.middlePath);
      },
    );

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.only(left: 12, top: 12, right: 12, bottom: 12),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(width: 0.33, color: Color(0xffe5e5e5)))),
        child: Row(
          children: <Widget>[header],
        ),
      ),
    );
  }

  void _onPopSelected(NineGridType value) {
    print('Sky24n _onPopSelected...... $value');
    if (_gridType != value) {
      _gridType = value;
      switch (value) {
        case NineGridType.weChatGp:
          _title = 'WeChat Group';
          break;
        case NineGridType.dingTalkGp:
          _title = 'DingTalk Group';
          break;
        case NineGridType.weChat:
          _title = 'WeChat';
          break;
        case NineGridType.weiBo:
          _title = 'WeiBo Intl';
          break;
        case NineGridType.normal:
          _title = 'Normal';
          break;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$_title'),
        centerTitle: true,
        actions: <Widget>[
          PopupMenuButton(
              icon: Icon(Icons.settings),
              padding: const EdgeInsets.all(0.0),
              onSelected: _onPopSelected,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuItem<NineGridType>>[
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weChatGp,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeChat Group',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.dingTalkGp,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'DingTalk Group',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weChat,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeChat',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.weiBo,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'WeiBo',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.normal,
                        child: ListTile(
                            contentPadding: EdgeInsets.all(0.0),
                            dense: false,
                            title: Text(
                              'Normal',
                            ))),
                    PopupMenuItem<NineGridType>(
                        value: NineGridType.normal,
                        child: ListTile(
                          contentPadding: EdgeInsets.all(0.0),
                          dense: false,
                          title: Text(
                            'Single Picture',
                          ),
                          onTap: () {
                            Utils.pushPage(context, SinglePicturePage());
                          },
                        )),
                  ]),
        ],
      ),
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 9,
          padding: EdgeInsets.all(0),
          itemBuilder: (BuildContext context, int index) {
            return _buildItem(context, index);
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Utils.pushPage(context, DragSortPage());
        },
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}
