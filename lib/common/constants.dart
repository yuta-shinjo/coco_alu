import 'package:flutter/material.dart';

const kDefaultImageURL = 'assets/images/picture.jpg';

const kTitleDecoration = InputDecoration(hintText: '名称：セキセイインコ');
const kKindsDecoration = InputDecoration(hintText: '種類：鳥類');
const kLocationDecoration = InputDecoration(hintText: '発見場所：家の近くの公園');
const kSizeDecoration = InputDecoration(hintText: 'サイズ：10センチ');
const kMemoDecoration = InputDecoration(
  hintText: 'メモ：家族になりたそうにこちらを見ていて可愛かった',
  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
);

const kDivider =
    Divider(height: 80, indent: 10, endIndent: 10, color: Colors.white);

const kTextStyle =
    TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w400);
const kExampleTextStyle =
    TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.w400);
