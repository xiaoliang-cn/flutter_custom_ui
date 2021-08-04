import 'package:flutter/material.dart';
///
///左右widget的 小部件
///一般配合两个Text widget 一起使用
class XLLRText extends StatelessWidget {
  final Widget? leftWidget;

  final Widget? rightWidget;

  final bool isDivider;
  final double height;
  final bool isFill;

  const XLLRText(
      {Key? key,
      this.leftWidget,
      this.rightWidget,
      this.isDivider = false,
      this.height = 90,
      this.isFill = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(),
      child: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 15,
                ),
                leftWidget != null ? leftWidget! : Container(),
                Spacer(
                  flex: 1,
                ),
                rightWidget != null
                    ? isFill
                        ? Expanded(child: rightWidget!)
                        : rightWidget!
                    : Container(),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          isDivider
              ? Divider(
                  height: 0.3,
                  color: Colors.black12,
                  indent: 10,
                )
              : Container()
        ],
      ),
    );
  }
}
