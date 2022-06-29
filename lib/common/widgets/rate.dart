import 'package:flutter/material.dart';

/**
 * 评分组件
 */
class RateWidget extends StatefulWidget {
  final double currentRate;
  final double maxRate;
  final int count;
  final double itemSize;
  final Color normalColor;
  final Color selectedColor;
  final Widget normalIcon;
  final Widget selectedIcon;

  RateWidget(
      {required this.currentRate,
      this.maxRate = 10,
      this.count = 5,
      this.itemSize = 44,
      this.normalColor = const Color.fromRGBO(237, 237, 237, 1),
      this.selectedColor = Colors.red,
      Widget? normalIcon,
      Widget? selectedIcon})
      : normalIcon =
            normalIcon ?? Icon(Icons.star, color: normalColor, size: itemSize),
        selectedIcon = selectedIcon ??
            Icon(Icons.star, color: selectedColor, size: itemSize);

  @override
  _RateWidgetState createState() => _RateWidgetState();
}

class _RateWidgetState extends State<RateWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildNormalStars()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStars()),
      ],
    );
  }

  List<Widget> buildNormalStars() {
    return List.generate(widget.count, (index) {
      return widget.normalIcon;
    });
  }

  List<Widget> buildSelectedStars() {
    // 计算
    double rate = widget.currentRate <= widget.maxRate
        ? widget.currentRate
        : widget.maxRate;
    double itemRate = widget.maxRate / widget.count;
    int rateCount = (widget.currentRate / itemRate).floor();

    // 完整
    List<Widget> stars = List.generate(rateCount, (index) {
      return widget.selectedIcon;
    });

    // 裁剪
    double diff = widget.currentRate % itemRate;
    if (diff != 0) {
      // 剩余宽度
      double clipWidth = diff / itemRate * widget.itemSize;
      stars.add(ClipRect(
        clipper: RateStarClipper(clipWidth),
        child: widget.selectedIcon,
      ));
    }

    return stars;
  }
}

class RateStarClipper extends CustomClipper<Rect> {
  double clipWidth;
  RateStarClipper(this.clipWidth);

  @override
  getClip(Size size) {
    return Rect.fromLTWH(0, 0, clipWidth, size.height);
  }

  @override
  bool shouldReclip(RateStarClipper oldClipper) {
    return clipWidth != oldClipper.clipWidth;
  }
}
