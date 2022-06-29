import 'package:flutter/material.dart';

/**
 * 虚线组件
 */
class DashedLineWidget extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;
  DashedLineWidget(
      {this.axis = Axis.horizontal,
      this.dashedWidth = 5,
      this.dashedHeight = 1,
      this.count = 10,
      this.color = const Color.fromRGBO(222, 222, 222, 1)});

  @override
  Widget build(BuildContext context) {
    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: this.axis,
      children: List.generate(this.count, (index) {
        return SizedBox(
          width: dashedWidth,
          height: dashedHeight,
          child: DecoratedBox(
            decoration: BoxDecoration(color: color),
          ),
        );
      }),
    );
  }
}
