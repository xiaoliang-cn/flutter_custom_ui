import 'package:flutter/material.dart';

class C1TextField extends StatefulWidget {
  final TextEditingController controller;
  final String? hintText;
  final TextInputType? textInputType;
  final bool isPassword;
  final VoidCallback? onTap;
  final double height;
  final Widget? suffixButton;
  final bool? enabled;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChangeListener;
  final int maxLines;
  final int maxLength;
  C1TextField(
      {Key? key,
      required this.controller,
      this.hintText,
      this.textInputType,
      this.isPassword = false,
      this.onTap,
      this.height = 120,
      this.suffixButton,
      this.enabled = true,
      this.focusNode,
      this.onChangeListener,
      this.maxLines = 1,
      this.maxLength = 100})
      : super(key: key);
  @override
  _C1TextFieldState createState() => _C1TextFieldState();
}

class _C1TextFieldState extends State<C1TextField> {
  bool _showPassword = false;
  bool _defaultShowRightWidget = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          TextField(
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 25,
            ),
            onChanged: (v) {
              if (widget.onChangeListener != null) {
                widget.onChangeListener!(v);
              }
              if (widget.controller.text.isNotEmpty) {
                _defaultShowRightWidget = false;
              } else {
                _defaultShowRightWidget = true;
              }
              (context as Element)..markNeedsBuild();
            },
            focusNode: widget.focusNode,
            controller: widget.controller,
            enabled: widget.enabled,
            keyboardType: widget.textInputType == null
                ? TextInputType.text
                : widget.textInputType!,
            obscureText: _showPassword,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
                counterText: '',
                contentPadding: EdgeInsets.only(left: 10),
                labelText: widget.hintText,
                alignLabelWithHint: true,
                labelStyle: TextStyle(fontSize: 25)),
          ),
          Visibility(
            visible: widget.isPassword ? true : _defaultShowRightWidget,
            child: widget.suffixButton != null
                ? widget.suffixButton!
                : widget.isPassword
                    ? Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: GestureDetector(
                          onLongPress: () {
                            _showPassword = false;
                            setState(() {});
                          },
                          onLongPressUp: () {
                            setState(() {
                              _showPassword = true;
                            });
                          },
                          child: Icon(Icons.password_rounded),
                        ),
                      )
                    : Container(),
          )
        ],
      ),
    );
  }
}
