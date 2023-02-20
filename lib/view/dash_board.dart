import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:trip_app/controller/data_controller.dart';
import 'package:trip_app/model/trip_model.dart';
import 'package:trip_app/view/details_bottomSheet.dart';

import 'package:trip_app/view/utility/custom_widget/custom_trip_widget.dart';

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

  List<Results> searchResult = [];

  ///===================================================> SearchResulrs
  void filterSearchResults(String query) {
    List<Results> searchList = [];

    searchList.addAll(
        Provider.of<DataController>(context, listen: false).trips.results!);

    if (query.isNotEmpty) {
      List<Results> dummyListData = [];
      for (var item in searchList) {
        if (item.firstName!.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      }
      setState(() {
        searchResult.clear();
        searchResult.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        searchResult.clear();
      });
    }
  }

  ///===================================================> filterSearchResulrs
  List<Results> filteredList = [];
  bool isFiltered = true;
  int statusNumber = 0;

  filterTripList() {
    List<Results> dummyList = [];
    List<Results> searchList = [];
    searchList.addAll(
        Provider.of<DataController>(context, listen: false).trips.results!);

    if (statusNumber >= 0 && statusNumber <= 3) {
      setState(() {
        isFiltered = false;
      });
      if (statusNumber == 0) {
        dummyList.clear();
        for (var element in searchList) {
          if (element.tripStatus!.contains('waiting')) {
            dummyList.add(element);
          }
        }
      } else if (statusNumber == 1) {
        dummyList.clear();
        for (var element in searchList) {
          if (element.tripStatus!.contains('approved')) {
            dummyList.add(element);
          }
        }
      } else if (statusNumber == 2) {
        dummyList.clear();
        for (var element in searchList) {
          if (element.tripStatus!.contains('denied')) {
            dummyList.add(element);
          }
        }
      } else {
        dummyList.clear();
        for (var element in searchList) {
          if (element.tripStatus!.contains('completed')) {
            dummyList.add(element);
          }
        }
      }
      setState(() {
        filteredList.clear();
        filteredList.addAll(dummyList);
      });
      statusNumber++;
      print(statusNumber);
    } else {
      statusNumber = 0;
      setState(() {
        isFiltered = !isFiltered;
      });
    }

    // setState(() {
    //   filteredList.clear();
    //   filteredList.addAll(dummyList);
    //   isFiltered = !isFiltered;
    // });

    log('trip list filtered');
    log(isFiltered.toString());
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<DataController>(context);
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
                    color: Colors.blueGrey.withOpacity(0.7),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(2, 5),
                  ),
                ],
              ),
              child: Center(
                child: TextField(
                  controller: _controller,
                  onChanged: filterSearchResults,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    hintText: 'Search a trip..',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.04,
            ),
            //==============================================> filter icon
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
                  onPressed: () {
                    filterTripList();
                    //filteredList.clear();
                  },
                  icon: const Icon(FeatherIcons.filter),
                ),
              ],
            ),

            ///==============================================> list of trips
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  await Provider.of<DataController>(context, listen: false)
                      .getAllTrips();
                },
                child: Visibility(
                  visible: data.isLoading,
                  replacement: const Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: ListView.builder(
                    // shrinkWrap: true,
                    itemCount: isFiltered
                        ? (searchResult.isEmpty
                            ? data.trips.count
                            : searchResult.length)
                        : (filteredList.isEmpty
                            ? data.trips.count
                            : filteredList.length),

                    itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          detailsBottomSheet(
                            context,
                            size,
                            isFiltered
                                ? (searchResult.isEmpty
                                    ? data.trips.results![index]
                                    : searchResult[index])
                                : (filteredList.isEmpty
                                    ? data.trips.results![index]
                                    : filteredList[index]),
                          );

                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => DetailScreen(
                          //       trip: data.trips[index],
                          //     ),
                          //   ),
                          // );
                        },
                        ////=====================================>  trip widgets
                        child: Column(
                          children: [
                            CustomTripWidget(
                              size: size,
                              index: index,
                              trip: isFiltered
                                  ? (searchResult.isEmpty
                                      ? data.trips.results![index]
                                      : searchResult[index])
                                  : (filteredList.isEmpty
                                      ? data.trips.results![index]
                                      : filteredList[index]),
                            ),
                            SizedBox(
                              height: size.width * 0.02,
                            )
                          ],
                        )),
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
