import 'package:flutter/material.dart';

/// Add .h OR .w to a numeric value to create SizedBox with the same height OR weight respectively.
extension EmptyPadding on num {
  Widget get h => SizedBox(height: toDouble());

  Widget get w => SizedBox(width: toDouble());
}
