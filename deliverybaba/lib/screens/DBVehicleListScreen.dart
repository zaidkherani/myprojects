import 'package:db_merchant_app/components/add_new_vehicle.dart';
import 'package:db_merchant_app/models/VehicleList.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';

class DBVehicleListScreen extends StatefulWidget {
  const DBVehicleListScreen({Key? key}) : super(key: key);

  @override
  _DBVehicleListScreenState createState() => _DBVehicleListScreenState();
}

class _DBVehicleListScreenState extends State<DBVehicleListScreen> {
  @override
  Widget build(BuildContext context) {
    setStatusBarColor(bgColor);
    return SafeArea(
      child: Scaffold(
        backgroundColor: bgColor,
        floatingActionButton: FloatingActionButton(
          // isExtended: true,
          child: Icon(
            Icons.add,
            color: black,
          ),
          backgroundColor: DBPrimaryColor,
          onPressed: () {
            finish(context);
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: (context) => Container(
                height: MediaQuery.of(context).size.height * 0.80,
                decoration: new BoxDecoration(
                  color: bgColor,
                  borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0),
                  ),
                ),
                child: AddNewVehicle(),
              ),
            );
          },
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(defaultPadding),
          child: Column(
            children: [
              SizedBox(height: defaultPadding),
              SearchField(),
              SizedBox(height: defaultPadding),
              AllVehicleList(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllVehicleList extends StatefulWidget {
  const AllVehicleList({Key? key}) : super(key: key);

  @override
  _AllVehicleListState createState() => _AllVehicleListState();
}

class _AllVehicleListState extends State<AllVehicleList> {
  List<VehicleActivity> VehicleActivities = demoVehicleActivity();

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:16),
                          child: Text(
                            "Vehicle\'s List",
                            style: boldTextStyle(
                                color: white.withOpacity(0.9), size: 18),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children: List.generate(VehicleActivities.length,
                                (index) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: bgColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                  border: Border.all(color: Colors.white10),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        '#${index + 1} ',
                                        style: boldTextStyle(
                                            size: 18,
                                            color: white.withOpacity(0.8)),
                                      ),
                                    ),
                                    4.width,
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[

                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      VehicleActivities[index]
                                                          .rc_no,
                                                      style: secondaryTextStyle(
                                                          color:
                                                          white.withOpacity(
                                                              0.6)),
                                                      maxLines: 1),
                                                  6.height,
                                                  Text(
                                                      VehicleActivities[index]
                                                          .vehicle,
                                                      style: boldTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.8)),
                                                      maxLines: 1),
                                                  4.height,
                                                  Text(
                                                      VehicleActivities[index]
                                                          .capacity,
                                                      style: secondaryTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                ],
                                              ),
                                              new Text(
                                                VehicleActivities[index]
                                                            .status ==
                                                        'Booked'
                                                    ? "Engaged"
                                                    : VehicleActivities[
                                                                    index]
                                                                .status ==
                                                            'Available'
                                                        ? "Available"
                                                        : "Running",
                                                style: boldTextStyle(
                                                    color: VehicleActivities[
                                                                    index]
                                                                .status ==
                                                            'Booked'
                                                        ? cyan
                                                        : VehicleActivities[
                                                                        index]
                                                                    .status ==
                                                                'Available'
                                                            ? greenColor
                                                            : yellow),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  VehicleActivities[index].date+" "+VehicleActivities[index].time,
                                                  style: secondaryTextStyle(
                                                      color: white
                                                          .withOpacity(0.6)),
                                                  maxLines: 1),
                                              4.height,
                                              Text(
                                                  VehicleActivities[index]
                                                      .location,
                                                  style: secondaryTextStyle(
                                                      color: white
                                                          .withOpacity(0.6)),
                                                  maxLines: 1),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ).onTap(() {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    backgroundColor: Colors.transparent,
                                    builder: (context) => Container(
                                      height: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.80,
                                      decoration: new BoxDecoration(
                                        color: bgColor,
                                        borderRadius: new BorderRadius.only(
                                          topLeft:
                                          const Radius.circular(25.0),
                                          topRight:
                                          const Radius.circular(25.0),
                                        ),
                                      ),
                                      child: EditVehicleDetail(),
                                    ));
                              });
                            }),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ).paddingOnly(bottom: 16, top: 16),
          ),
        ],
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(color: white.withOpacity(0.7)),
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(color: white.withOpacity(0.5)),
        fillColor: secondaryColor,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(defaultPadding * 0.75),
            margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset("assets/icons/Search.svg"),
          ),
        ),
      ),
    );
  }
}
