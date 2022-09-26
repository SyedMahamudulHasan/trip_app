import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:trip_app/view/details_screen.dart';
import '../model/utility/custom_widget/custom_trip_widget.dart';

class DashBoardScreen extends StatefulWidget {
  static String id = '/dashBoard';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  late TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16, vertical: size.height * 0.08),
        child: Column(
          children: [
            ///===============================> search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              //width: size.width,
              height: size.height * 0.08,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(2, 5),
                  ),
                ],
              ),
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                  hintText: 'Search a trip..',
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            ////==============================================> filter icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trip request list',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.w700,
                    fontSize: size.width * 0.05,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(FeatherIcons.filter),
                ),
              ],
            ),

            ///==============================================> list of trips
            Expanded(
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, DetailScreen.id);
                  },
                  child: CustomTripWidget(
                    size: size,
                    index: index,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
