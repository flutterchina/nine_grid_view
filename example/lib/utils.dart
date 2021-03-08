import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'models.dart';

class Utils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static Future<T?> pushPage<T extends Object>(
      BuildContext context, Widget page) {
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (ctx) => page),
    );
  }

  static void showSnackBar(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 2),
      ),
    );
  }

  static Widget getWidget(String url) {
    if (url.startsWith('http')) {
      //return CachedNetworkImage(imageUrl: url, fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    }
    //return Image.file(File(url), fit: BoxFit.cover);
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static Image? getBigImage(String? url) {
    if (url == null || url.isEmpty) return null;
    if (url.startsWith('http')) {
      //return Image(image: CachedNetworkImageProvider(url), fit: BoxFit.cover);
      return Image.network(url, fit: BoxFit.cover);
    }
    if (url.endsWith('.png')) {
      return Image.asset(url,
          fit: BoxFit.cover, package: 'flutter_gallery_assets');
    }
    //return Image.file(File(url), fit: BoxFit.cover);
    return Image.asset(getImgPath(url), fit: BoxFit.cover);
  }

  static List<ImageBean> getTestData() {
    List<String> urlList = [
      'ali_connors',
      'people/square/ali.png',
      'people/ali_landscape.png',
      'people/square/peter.png',
      'people/square/sandra.png',
      'people/square/trevor.png',
      'places/india_tanjore_bronze_works.png',
      'places/india_tanjore_market_merchant.png',
      'places/india_tanjore_thanjavur_temple_carvings.png',
    ];
    List<ImageBean> list = [];
    for (int i = 0; i < urlList.length; i++) {
      String url = urlList[i];
      list.add(ImageBean(
        originPath: url,
        middlePath: url,
        thumbPath: url,
        originalWidth: i == 0 ? 264 : null,
        originalHeight: i == 0 ? 258 : null,
      ));
    }
    return list;
  }
}
