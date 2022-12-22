import 'package:flutter/material.dart';

Map<ColorsEnum, Color> ColorList = {
  ColorsEnum.lightGreen: Color(0xff1fd655),
  ColorsEnum.veryLightGreen: Color(0xff83f28f),
  ColorsEnum.yellow: Color(0xffffd36f),
  ColorsEnum.background: Color(0xfff8f8f8),
  ColorsEnum.white: Color(0xffffffff),
  ColorsEnum.black: Color(0xff000000),
  ColorsEnum.grey: Color(0xffbcbcbc),
  ColorsEnum.transparent: Colors.transparent,
};

enum ColorsEnum {
  lightGreen,
  veryLightGreen,
  yellow,
  background,
  white,
  black,
  grey,
  transparent,
}

Map FontFamilyList = {
  'Montserrat': 'Montserrat',
};

Map FontWeightList = {
  'semibold': FontWeight.w600,
  'bold': FontWeight.w700,
};

final ThemeData LightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    backgroundColor: ColorList[ColorsEnum.grey],
  );
}
