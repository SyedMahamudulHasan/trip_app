import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomTripWidget extends StatefulWidget {
  const CustomTripWidget({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<CustomTripWidget> createState() => _CustomTripWidgetState();
}

class _CustomTripWidgetState extends State<CustomTripWidget> {
  Widget tripDataWidget({size, icon, text, isButton = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Icon(icon),
              SizedBox(
                width: size.width * 0.02,
              ),
              Text(text),
            ],
          ),
        ),
        isButton
            ? IconButton(onPressed: () {}, icon: const Icon(FeatherIcons.check))
            : const SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 10),
      // height: size.height * 0.10,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(08),
          border: Border.all(color: Colors.black12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 0,
              blurRadius: 2,
              offset: const Offset(1, 3),
            ),
          ]),
      child: Column(
        children: [
          tripDataWidget(
            size: widget.size,
            icon: FeatherIcons.key,
            text: "71f15860-5bc4-4ff6-a814-416e9dc501f4",
          ),
          tripDataWidget(
              size: widget.size,
              icon: FeatherIcons.user,
              text: "User name",
              isButton: true),
          tripDataWidget(
              size: widget.size, icon: FeatherIcons.mapPin, text: "locations"),
        ],
      ),
    );
  }
}
