import 'package:db_merchant_app/components/DBDateRangeDialog.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

import 'notification_card.dart';

class NotificationTabRequestComponent extends StatefulWidget {
  @override
  NotificationTabRequestComponentState createState() =>
      NotificationTabRequestComponentState();
}

class NotificationTabRequestComponentState
    extends State<NotificationTabRequestComponent> {
  String selectedDays = 'Monthly';
  var mSelectedDate = 'dd-MMM-yyyy';
  var mSelectedDate1 = 'dd-MMM-yyyy';
  var mSelectedDateNum = 'dd-MM-yyyy';
  var mSelectedDateNum1 = 'dd-MM-yyyy';
  var mVisible = false;
  DateTime selectedDate = DateTime.now();


  Future<Null> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate = DateFormat('dd-MMM-yyyy').format(selectedDate.toLocal());
      mSelectedDateNum = DateFormat('yyyy-MM-dd').format(selectedDate.toLocal());
      init();
      setState(() {
        mVisible = true;
      });
    });
  }


  Future<Null> selectDate1(BuildContext context) async {
    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate1 = DateFormat('dd-MMM-yyyy').format(selectedDate.toLocal());
      mSelectedDateNum1 = DateFormat('yyyy-MM-dd').format(selectedDate.toLocal());
      init();
    }
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            value: selectedDays,
            dropdownColor: Colors.transparent,
            icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
            items: <String>['Monthly', 'Weekly', 'Daily'].map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child:
                    Text(value, style: primaryTextStyle(color: Colors.white)),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                selectedDays = newValue!;
              });
            },
          ),
        ).paddingLeft(16),
        8.height,
        Container(
          decoration: boxDecorationWithRoundedCorners(
            borderRadius: radius(12),
            backgroundColor: DBSecondaryColor.withOpacity(0.2),
          ),
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              dbBackCircleWidget().onTap(
                  (){
                    selectDate(context);
                  }
              ),
              4.width,
              Column(
                children: [
                  Text(DateFormat('MMMM').format(DateTime.now()),
                      style: boldTextStyle(color: Colors.white)),
                  4.height,
                  Row(
                    children: [
                      Text(mSelectedDate, style: secondaryTextStyle(color: Colors.white)),
                      Visibility(
                        visible: mVisible,
                        child: Text(' - ${mSelectedDate1}', style: secondaryTextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
              4.width,
              dbNextCircleWidget().onTap(
                  (){
                    selectDate1(context);
                  }
              ),
            ],
          ),
        ).paddingOnly(left: 16, right: 16),
        16.height,
        // Container(
        //   margin: EdgeInsets.all(defaultPadding),
        //   padding: EdgeInsets.all(defaultPadding),
        //   decoration: BoxDecoration(
        //     color: secondaryColor,
        //     borderRadius: const BorderRadius.all(Radius.circular(10)),
        //   ),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Text(
        //         "Request List",
        //         style: TextStyle(
        //           fontSize: 18,
        //           fontWeight: FontWeight.w500,
        //           color: white.withOpacity(0.9),
        //         ),
        //       ),
        //       SizedBox(height: defaultPadding),
        //       NotificationCard(
        //         svgSrc: "assets/icons/Documents.svg",
        //         title: "Total Vehicles",
        //         amountOfFiles: "13",
        //       ),
        //       NotificationCard(
        //         svgSrc: "assets/icons/media.svg",
        //         title: "Total Drivers",
        //         amountOfFiles: "28",
        //       ),
        //       NotificationCard(
        //         svgSrc: "assets/icons/folder.svg",
        //         title: "Total Orders",
        //         amountOfFiles: "50",
        //       ),
        //       NotificationCard(
        //         svgSrc: "assets/icons/unknown.svg",
        //         title: "Transactions",
        //         amountOfFiles: "5438",
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
