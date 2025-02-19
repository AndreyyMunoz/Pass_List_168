import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:past_list/config/colors.dart';

class MessageBackground extends StatelessWidget {
  const MessageBackground({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 150.0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: 465,
                width: 473,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: k3AccentLines),
                  borderRadius: BorderRadius.circular(152.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: 465,
                width: 473,
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: k3AccentLines),
                  borderRadius: BorderRadius.circular(152.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 260,
            child: Transform.rotate(
              angle: math.pi / 4,
              child: Container(
                height: 575,
                width: 580,
                decoration: BoxDecoration(
                  color: k2MainThemeColor,
                  borderRadius: BorderRadius.circular(152.0),
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
