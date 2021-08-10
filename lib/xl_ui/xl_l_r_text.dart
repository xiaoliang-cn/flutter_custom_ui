import 'package:flutter/material.dart';

///
///左右widget的 小部件
///一般配合两个Text widget 一起使用
class XLLRText extends StatelessWidget {
  final Widget? leftWidget;

  final Widget? rightWidget;

  //显示一条分割线
  final bool isDivider;
  //widget height
  final double height;
  

  final VoidCallback? onTap;

  const XLLRText(
      {Key? key,
      this.leftWidget,
      this.rightWidget,
      this.isDivider = false,
      this.height = 90,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
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
                  rightWidget != null ? rightWidget! : Container(),
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
      ),
    );
  }
}
