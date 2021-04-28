Language: English | [中文简体](README-ZH.md)

[![Pub](https://img.shields.io/pub/v/nine_grid_view.svg?style=flat-square&color=009688)](https://pub.dartlang.org/packages/nine_grid_view)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Pub](https://img.shields.io/pub/v/nine_grid_view.svg?style=flat-square&color=2196F3)](https://pub.flutter-io.cn/packages/nine_grid_view)

### NineGridView
Similar to Weibo dynamics, WeChat circle of friends, nine grid view controls to display pictures. Support single big picture preview.  
It also supports WeChat group , DingTalk group, QQ group avatar effects.

### DragSortView
Similar to Weibo/WeChat release dynamic picture selection nine grid view. Support press to enlarge effect, drag and drop sorting, drag and drop to a specified location to delete.

### Pub
```yaml
dependencies:
  nine_grid_view: ^2.0.0
```

### Example
```yaml
import 'package:nine_grid_view/nine_grid_view.dart';

// bigImage param, It is recommended to use a medium-quality picture, because the original picture is too large and takes time to load.
NineGridView(
  margin: EdgeInsets.all(12),
  padding: EdgeInsets.all(5),
  space: 5,
  type: NineGridType.weChat,//NineGridType.weChat, NineGridType.weiBo
  itemCount: itemCount,
  itemBuilder: (BuildContext context, int index) {},
);

// group avatar.
// need width, height param.
NineGridView(
  width: 120,
  height: 120,
  padding: EdgeInsets.all(5),
  space: 5,
  type: NineGridType.qqGp, //NineGridType.weChatGp, NineGridType.dingTalkGp
  itemCount: itemCount,
  itemBuilder: (BuildContext context, int index) {},
);

// It is recommended to use a thumbnail picture，because the original picture is too large, it may cause repeated loading and cause flashing.
DragSortView(
  imageList,
  space: 5,
  margin: EdgeInsets.all(20),
  padding: EdgeInsets.all(0),
  itemBuilder: (BuildContext context, int index) {},
  initBuilder: (BuildContext context) {},
  onDragListener: (MotionEvent event, double itemWidth) {
    /// Judge to drag to the specified position to delete
    /// return true;
    if (event.globalY > 600) {
      return true;
    }
    return false;
  },
);   
```

### Screenshots
|![](https://s1.ax1x.com/2020/08/05/ar88bR.jpg)|![](https://s1.ax1x.com/2020/08/05/arG6OJ.jpg)|![](https://s1.ax1x.com/2020/08/05/artZyF.jpg)|
|:---:|:---:|:---:|
|![](https://s1.ax1x.com/2020/08/05/artlJx.jpg)|![](https://s1.ax1x.com/2020/08/05/artJyD.jpg)|![](https://s1.ax1x.com/2020/08/05/art2wj.jpg)|
|![](https://s1.ax1x.com/2020/08/05/art4f0.jpg)|![](https://s1.ax1x.com/2020/08/05/artIpV.jpg)|![](https://s1.ax1x.com/2020/08/05/artXkR.gif)|

## Changelog
Please see the [Changelog](CHANGELOG.md) page to know what's recently changed.

## Others
Another [NineGridView](https://github.com/flutterchina/flukit) in [flukit](https://github.com/flutterchina/flukit) UI Kit，using GridView implementation。But in this project used Stack + Positioned。

## App
[Moss](https://github.com/Sky24n/Moss).  
A GitHub client app developed with Flutter, which supports Android iOS Web.  
Web ：[Flutter Web](https://sky24n.gitee.io/moss/web/index.html).

|![](https://z3.ax1x.com/2021/04/26/gp1hm6.jpg)|![](https://z3.ax1x.com/2021/04/26/gp1Tte.jpg)|![](https://z3.ax1x.com/2021/04/26/gp17fH.jpg)|
|:---:|:---:|:---:|


