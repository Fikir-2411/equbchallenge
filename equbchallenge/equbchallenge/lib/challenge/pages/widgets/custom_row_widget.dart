import 'package:flutter/material.dart';

class CustomRow extends StatelessWidget {
  final IconData? iconData, iconData2;
  final String text;
  final double? leftPadding, topPadding, bottomPadding;
  final Color? color;
  final FontWeight? fontWeight;
  final onPressed;
  const CustomRow(
      {Key? key,
      this.iconData,
      this.iconData2,
      required this.text,
      this.leftPadding,
      this.color,
      this.fontWeight,
      this.topPadding,
      this.bottomPadding,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: leftPadding ?? 5.0,
          top: topPadding ?? 0,
          bottom: bottomPadding ?? 0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            iconData,
            color: color ?? Colors.black,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(text,
              style: TextStyle(
                  fontSize: 13,
                  color: color ?? Colors.black,
                  fontWeight: fontWeight ?? FontWeight.normal)),
          iconData2 != null ? Spacer() : SizedBox.shrink(),
          iconData2 != null
              ? IconButton(onPressed: onPressed, icon: Icon(iconData2))
              : SizedBox.shrink()
        ],
      ),
    );
  }
}
