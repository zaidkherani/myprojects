import 'package:db_merchant_app/components/add_new_driver.dart';
import 'package:db_merchant_app/models/DriverActivity.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:flutter_svg/svg.dart';

class DBDriverListScreen extends StatefulWidget {
  const DBDriverListScreen({Key? key}) : super(key: key);

  @override
  _DBDriverListScreenState createState() => _DBDriverListScreenState();
}

class _DBDriverListScreenState extends State<DBDriverListScreen> {
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
                child: AddNewDriver(),
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
              AllDriverList(),
            ],
          ),
        ),
      ),
    );
  }
}

class AllDriverList extends StatefulWidget {
  const AllDriverList({Key? key}) : super(key: key);

  @override
  _AllDriverListState createState() => _AllDriverListState();
}

class _AllDriverListState extends State<AllDriverList> {
  List<DriverActivity> DriverActivities = demoDriverActivity();
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
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            "Driver\'s List",
                            style: boldTextStyle(
                                color: white.withOpacity(0.9), size: 18),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Wrap(
                            spacing: 16,
                            runSpacing: 16,
                            children:
                                List.generate(DriverActivities.length, (index) {
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
                                                      DriverActivities[index]
                                                          .license,
                                                      style: secondaryTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                  8.height,
                                                  Text(
                                                      DriverActivities[index]
                                                          .vehicle,
                                                      style: boldTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.8)),
                                                      maxLines: 1),
                                                  4.height,
                                                  Text(
                                                      DriverActivities[index]
                                                          .phone,
                                                      style: secondaryTextStyle(
                                                          color:
                                                              white.withOpacity(
                                                                  0.6)),
                                                      maxLines: 1),
                                                ],
                                              ),
                                              new Text(
                                                DriverActivities[index]
                                                            .status ==
                                                        'Offline'
                                                    ? "Offline"
                                                    : DriverActivities[index]
                                                                .status ==
                                                            'Online'
                                                        ? "Online"
                                                        : "Cancel",
                                                style: boldTextStyle(
                                                    color: DriverActivities[
                                                                    index]
                                                                .status ==
                                                            'Offline'
                                                        ? DBSecondaryColor
                                                        : DriverActivities[
                                                                        index]
                                                                    .status ==
                                                                'Online'
                                                            ? greenColor
                                                            : redColor),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                  DriverActivities[index].date +
                                                      " " +
                                                      DriverActivities[index]
                                                          .time,
                                                  style: secondaryTextStyle(
                                                      color: white
                                                          .withOpacity(0.6)),
                                                  maxLines: 1),
                                              4.height,
                                              Text(
                                                  DriverActivities[index]
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
                                          child: EditDriverDetail(),
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
