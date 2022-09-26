import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class CustomTripWidget extends StatelessWidget {
  CustomTripWidget({
    Key? key,
    required this.size,
    required this.index,
  }) : super(key: key);
  final Size size;
  final int index;

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

  final leftEditIcon = Container(
    padding: const EdgeInsets.only(left: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: const Color(0xFF2e3253).withOpacity(0.5),
    alignment: Alignment.centerLeft,
    child: const Icon(
      Icons.edit,
      color: Colors.white,
    ),
  );
  final rightEditIcon = Container(
    padding: const EdgeInsets.only(right: 20),
    margin: const EdgeInsets.only(bottom: 10),
    color: Colors.redAccent,
    alignment: Alignment.centerRight,
    child: const Icon(
      Icons.delete,
      color: Colors.white,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ObjectKey(index),
      background: leftEditIcon,
      secondaryBackground: rightEditIcon,
      onDismissed: (direction) {},
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          showModalBottomSheet(
              context: context,
              builder: ((context) {
                return Container();
              }));
          return false;
        } else {
          return true;
        }
      },
      child: Container(
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
              size: size,
              icon: FeatherIcons.key,
              text: "71f15860-5bc4-4ff6-a814-416e9dc501f4",
            ),
            tripDataWidget(
                size: size,
                icon: FeatherIcons.user,
                text: "User name",
                isButton: true),
            tripDataWidget(
                size: size, icon: FeatherIcons.mapPin, text: "locations"),
          ],
        ),
      ),
    );
  }
}
