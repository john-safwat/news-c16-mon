import 'package:flutter/cupertino.dart';

extension WhiteSpaceUtils on num {

  SizedBox get spaceVertical => SizedBox(height: toDouble());
  SizedBox get spaceHorizontal => SizedBox(width: toDouble());
  SizedBox get space => SizedBox(height: toDouble() , width: toDouble(),);

}