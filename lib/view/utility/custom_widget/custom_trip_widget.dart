import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/model/constants.dart';
import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/view/utility/constants.dart';

class CustomTripWidget extends StatefulWidget {
  const CustomTripWidget({
    Key? key,
    required this.size,
    required this.index,
    required this.trip,
  }) : super(key: key);

  final Size size;
  final int index;
  final TripModel trip;

  @override
  State<CustomTripWidget> createState() => _CustomTripWidgetState();
}

class _CustomTripWidgetState extends State<CustomTripWidget> {
  Widget tripDataWidget(
      {size, icon, text, isButton = false, required iconColor}) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          child: Row(
            children: [
              Icon(
                icon,
                color: iconColor,
              ),
              SizedBox(
                width: size.width * 0.02,
              ),
              AutoSizeText(
                text,
                maxLines: 2,
              ),
            ],
          ),
        ),
        isButton
            ? SizedBox(
                height: 40,
                width: 40,
                child: Image.asset(
                    statusIcon[widget.trip.tripStatus as String].toString()))
            : const SizedBox()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final TripInformation tripInformation =
        widget.trip.tripInformation as TripInformation;
    final controller = Provider.of<DataController>(context, listen: false);
    bool isPost = false;
    return Slidable(
      key: ObjectKey(widget.index),
      closeOnScroll: false,
      startActionPane: ActionPane(
        dragDismissible: false,
        motion: const ScrollMotion(),
        // dismissible: DismissiblePane(onDismissed: () {

        // }),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: ((context) async {
              isPost = await controller.changeTripStatus({
                "id": widget.trip.requestTripId.toString(),
                "status": "denied",
              });

              // showDialog(
              //     context: context,
              //     builder: ((context) => AlertDialog(
              //           title: Text('ses'),
              //         )));
            }),
            backgroundColor: Colors.redAccent, //
            foregroundColor: Colors.white,
            icon: FeatherIcons.xCircle,
            label: 'Cancel',
          ),

          SlidableAction(
            onPressed: ((context) {
              controller.changeTripStatus({
                "id": widget.trip.requestTripId.toString(),
                "status": "approved"
              });
            }),
            backgroundColor: const Color(0xFF21B7CA),
            foregroundColor: Colors.white,
            icon: Icons.check,
            label: 'Confirm',
          ),
        ],
      ),

      // The end action pane is the one at the right or the bottom side.
      //==========================================================>conpleted
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: ((context) {
              controller.changeTripStatus({
                "id": widget.trip.requestTripId.toString(),
                "status": "completed",
              });
            }),
            backgroundColor: KConstColors
                .secondaryColor, //const Color(0xFF2e3253).withOpacity(0.5),
            foregroundColor: Colors.white,
            icon: Icons.check_circle_outline,
            label: 'Completed',
          ),
        ],
      ),
      child: Container(
        padding: const EdgeInsets.all(8),
        //margin: const EdgeInsets.only(bottom: 10),
        //height: size.height * 0.15,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(08),
          border: Border.all(color: Colors.black12),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.blueGrey.withOpacity(0.7),
          //     spreadRadius: 0,
          //     blurRadius: 2,
          //     offset: const Offset(1, 3),
          //   ),
          // ],
        ),
        child: Column(
          children: [
            tripDataWidget(
              size: widget.size,
              //icon: FeatherIcons.key,
              text: "${widget.trip.requestTripId}",
              iconColor: Colors.grey,
            ),
            tripDataWidget(
              size: widget.size,
              icon: FeatherIcons.user,
              text: tripInformation.fullName,
              isButton: true,
              iconColor: KConstColors.secondaryColor,
            ),
            tripDataWidget(
                size: widget.size,
                icon: FeatherIcons.mapPin,
                iconColor: Colors.redAccent,
                text:
                    "${tripInformation.pickupLocationName} to ${tripInformation.destinationName}"),
          ],
        ),
      ),
    );
  }
}
