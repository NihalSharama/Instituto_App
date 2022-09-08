import 'package:flutter/material.dart';

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 360;
    final double _yScaling = size.height / 807;
    path.lineTo(57 * _xScaling, 216.097 * _yScaling);
    path.cubicTo(
      -21.4 * _xScaling,
      208.123 * _yScaling,
      -46.3333 * _xScaling,
      232.71 * _yScaling,
      -49 * _xScaling,
      246 * _yScaling,
    );
    path.cubicTo(
      -49 * _xScaling,
      246 * _yScaling,
      -103 * _xScaling,
      16.7419 * _yScaling,
      -103 * _xScaling,
      16.7419 * _yScaling,
    );
    path.cubicTo(
      -103 * _xScaling,
      16.7419 * _yScaling,
      263 * _xScaling,
      -63 * _yScaling,
      263 * _xScaling,
      -63 * _yScaling,
    );
    path.cubicTo(
      263 * _xScaling,
      -63 * _yScaling,
      411 * _xScaling,
      44.6516 * _yScaling,
      411 * _xScaling,
      44.6516 * _yScaling,
    );
    path.cubicTo(
      398.333 * _xScaling,
      82.529 * _yScaling,
      361.4 * _xScaling,
      163.866 * _yScaling,
      315 * _xScaling,
      186.194 * _yScaling,
    );
    path.cubicTo(
      257 * _xScaling,
      214.103 * _yScaling,
      155 * _xScaling,
      226.065 * _yScaling,
      57 * _xScaling,
      216.097 * _yScaling,
    );
    path.cubicTo(
      57 * _xScaling,
      216.097 * _yScaling,
      57 * _xScaling,
      216.097 * _yScaling,
      57 * _xScaling,
      216.097 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
