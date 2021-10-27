import 'package:db_merchant_app/components/DBSelectVehicle.dart';
import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:db_merchant_app/utils/sliderButton/slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nb_utils/nb_utils.dart';


class DBTransactionComponent extends StatefulWidget {
  static String tag = '/DBTransactionComponent';
  var status;
  DBTransactionComponent({this.status});
  @override
  DBTransactionComponentState createState() => DBTransactionComponentState();
}

class DBTransactionComponentState extends State<DBTransactionComponent> {
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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Today\'s Activity',
              style: boldTextStyle(color: white.withOpacity(0.8))),
          15.height,


          Divider(),

          Align(
            alignment: Alignment.topLeft,
            child: Text('Order Details',
                style: boldTextStyle(color: white.withOpacity(0.8))),
          ),
          8.height,
          dbTitleWidget(
            title: "Sender Name",
            subTitle: "Hemant",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
          ),
          8.height,
          dbTitleWidget(
            title: "Sender No.",
            subTitle: "+91-0132456789",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
          ),
          8.height,
          dbTitleWidget(
            title: "Receiver Name.",
            subTitle: "Zaid",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
          ),
          8.height,
          dbTitleWidget(
            title: "Receiver No.",
            subTitle: "+91-0132456789",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order Date',
                  style: primaryTextStyle(
                      size: 14, color: white.withOpacity(0.6))),

              Spacer(),
              Text('17/10/2021', style: primaryTextStyle(
                  size: 14, color: white.withOpacity(0.6))),
            ],
          ),
          8.height,
          dbTitleWidget(
            title: "Delivery Date",
            subTitle: "21/10/2021",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
            titleColor: white,
          ),

          8.height,
          dbTitleWidget(
            title: "Pick-Up Address",
            subTitle: "Jainam Vihar Pachpedi  Naka Raipur Jainam Vihar Pachpedi  Naka Raipur",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6),),
            titleColor: white,
          ),
          8.height,
          dbTitleWidget(
            title: "Drop Address",
            subTitle: "Telibandha Chowk Raipur",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6),),
            titleColor: white,
          ),
          Divider(),

          8.height,
          widget.status=='Accepted'?Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('Transportation Details',
                    style: boldTextStyle(color: white.withOpacity(0.8))),
              ),
              8.height,
              dbTitleWidget(
                title: "Vehicle Name",
                subTitle: "Sumo Gold",
                subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
              ),
              8.height,
              dbTitleWidget(
                title: "Vehicle No",
                subTitle: "CG04NA0000",
                subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
              ),
              8.height,
              dbTitleWidget(
                title: "Driver Name",
                subTitle: "Munna",
                subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
              ),
              8.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Driver No',
                      style: primaryTextStyle(
                          size: 14, color: white.withOpacity(0.6))),


                  Spacer(),
                  Text('+91-0123456789',style: boldTextStyle(
                      size: 14, color: white.withOpacity(0.6))),
                ],
              ),
              8.height,

            ],
          ):Container(),
          Divider(),
          8.height,
          Align(
            alignment: Alignment.topLeft,
            child: Text('Transactions details',
                style: boldTextStyle(color: white.withOpacity(0.8))),
          ),

          8.height,
          dbTitleWidget(
            title: "Order amount",
            subTitle: "\₹240.51",
            subTitleStyle: boldTextStyle(color: white.withOpacity(0.6)),
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('GST (15%)',
                  style: primaryTextStyle(
                      size: 14, color: white.withOpacity(0.6))),


              Spacer(),
              Text('\₹36', style: boldTextStyle(
                  color: white.withOpacity(0.6))),
            ],
          ),
          8.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total',
                  style: boldTextStyle(
                      size: 16, color: white.withOpacity(0.6))),


              Spacer(),
              Text('\₹277.00',style: boldTextStyle(
                size: 16, color: white.withOpacity(0.6),)),
            ],
          ),
          16.height,
          Text('Payment received in seconds',
              style: secondaryTextStyle(color: white.withOpacity(0.6))),
          16.height,
          SliderButton(
            buttonSize: 40,
            disable: false,
            // dismissible: true,
            backgroundColor: secondaryColor,
            action: () {
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
                  child: DBSelectVehicle(),
                ),
              );
            },
            label: Text("Swipe to accept request",
                style: secondaryTextStyle(color: Colors.white)),
            icon: Icon(Icons.navigate_next_outlined, color: black),
          ),

        ],
      ).paddingAll(16),
    );
  }
}
