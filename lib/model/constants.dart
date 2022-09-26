import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class Kwidgets {
  static Container tripdataItem({dataType, data, size, width = 1}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(8),
      width: size.width * width,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(08),
        border: Border.all(color: Colors.black12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            //spreadRadius: 0,
            blurRadius: 1.5,
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            dataType + ":  ",
            style: const TextStyle(
              fontFamily: 'urbanist',
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          ),
          AutoSizeText(
            data,
            style: const TextStyle(
              fontFamily: 'urbanist',
              //fontWeight: FontWeight.w400,
            ),
            maxLines: 2,
          )
        ],
      ),
    );
  }
}
