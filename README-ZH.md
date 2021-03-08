Language: [English](https://github.com/flutterchina/nine_grid_view) | 中文简体

[![Pub](https://img.shields.io/pub/v/nine_grid_view.svg?style=flat-square&color=009688)](https://pub.dartlang.org/packages/nine_grid_view)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[![Pub](https://img.shields.io/pub/v/nine_grid_view.svg?style=flat-square&color=2196F3)](https://pub.flutter-io.cn/packages/nine_grid_view)

### NineGridView
类似微博动态，微信朋友圈，展示图片的九宫格控件。支持单张大图预览。  
同时也支持微信群组，钉钉群组，QQ讨论组头像效果。

### DragSortView
类似微博/微信发布动态选图九宫格。支持按压放大效果，拖拽排序，拖拽到指定位置删除。

### Pub
```yaml
dependencies:
  nine_grid_view: #latest version
```

### Example
```yaml
import 'package:nine_grid_view/nine_grid_view.dart';

// bigImage参数 单张大图建议使用中等质量图片，因为原图太大加载耗时。
NineGridView(
  margin: EdgeInsets.all(12),
  padding: EdgeInsets.all(5),
  space: 5,
  type: NineGridType.weChat,
  itemCount: itemCount,
  itemBuilder: (BuildContext context, int index) {},
);

// 头像需要设置宽、高参数。
NineGridView(
  width: 120,
  height: 120,
  padding: EdgeInsets.all(5),
  space: 5,
  type: NineGridType.qqGp, //NineGridType.weChatGp, NineGridType.dingTalkGp
  itemCount: itemCount,
  itemBuilder: (BuildContext context, int index) {},
);

// 建议使用略微缩图，因为原图太大可能会引起重复加载导致闪动.
DragSortView(
  imageList,
  space: 5,
  margin: EdgeInsets.all(20),
  padding: EdgeInsets.all(0),
  itemBuilder: (BuildContext context, int index) {},
  initBuilder: (BuildContext context) {},
  onDragListener: (MotionEvent event, double itemWidth) {
    /// 判断拖动到指定位置删除
    /// return true;
    if (event.globalY > 600) {
      return true;
    }
    return false;
  },
);     
```

### Screenshots

截图无法查看？  
掘金地址：[Flutter 仿微信/微博九宫格](https://juejin.im/post/5ee825ab5188251f3f07af75)、[Flutter 仿QQ讨论组头像](https://juejin.im/post/5efd42665188252e6350d496)  
简书地址：[Flutter 仿微信/微博九宫格](https://www.jianshu.com/p/73548cc82326)

|![](https://s1.ax1x.com/2020/08/05/ar88bR.jpg)|![](https://s1.ax1x.com/2020/08/05/arG6OJ.jpg)|![](https://s1.ax1x.com/2020/08/05/artZyF.jpg)|
|:---:|:---:|:---:|
|![](https://s1.ax1x.com/2020/08/05/artlJx.jpg)|![](https://s1.ax1x.com/2020/08/05/artJyD.jpg)|![](https://s1.ax1x.com/2020/08/05/art2wj.jpg)|
|![](https://s1.ax1x.com/2020/08/05/art4f0.jpg)|![](https://s1.ax1x.com/2020/08/05/artIpV.jpg)|![](https://s1.ax1x.com/2020/08/05/artXkR.gif)|

## Changelog
Please see the [Changelog](CHANGELOG.md) page to know what's recently changed.

## App
[Moss App](https://github.com/Sky24n/Moss)

### Others
另外一个[NineGridView](https://github.com/flutterchina/flukit)在 [flukit](https://github.com/flutterchina/flukit) UI组件库里面，通过封装GridView实现。本项目使用的Stack + Positioned实现。