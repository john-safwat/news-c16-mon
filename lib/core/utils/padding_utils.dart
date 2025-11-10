import 'package:flutter/material.dart';

extension PaddingUtils on Widget {
  Widget withPadding(double padding) {
    return Padding(padding: EdgeInsets.all(padding), child: this,);
  }

  Widget withHorizontalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: this,
    );
  }

  Widget withVerticalPadding(double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding),
      child: this,
    );
  }

  Widget withSymmetricPadding(
    double paddingHorizontal,
    double paddingVertical,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: paddingHorizontal,
        vertical: paddingVertical,
      ),
      child: this,
    );
  }
}
