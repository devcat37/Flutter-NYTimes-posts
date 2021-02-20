import 'package:flutter/material.dart';

class Sizing {
  static double _screenWidth;
  static double _screenHeight;

  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplayer;
  static double imageSizeMultiplayer;
  static double heightMultiplayer;
  static double widthMultiplayer;

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      _screenWidth = constraints.maxWidth;
      _screenHeight = constraints.maxHeight;
    } else {
      _screenWidth = constraints.maxHeight;
      _screenHeight = constraints.maxWidth;
    }

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplayer = _blockSizeHorizontal;
    imageSizeMultiplayer = _blockSizeHorizontal;

    heightMultiplayer = _blockSizeVertical;
    widthMultiplayer = _blockSizeHorizontal;

    // print('Width: ' + widthMultiplayer.toString());
    // print('Height: ' + heightMultiplayer.toString());
  }
}
