import 'dart:convert';

import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';


class AddNewVehicle extends StatefulWidget {

  @override
  AddNewVehicleState createState() => AddNewVehicleState();
}

class AddNewVehicleState extends State<AddNewVehicle> {
  String Tirpal = 'Select Tirpal';
  String Daala = 'Select Daala';


  var mSelectedDate = 'Vehicle Model Year';
  var mSelectedDate1 = 'Insurance Valid Till';
  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate = DateFormat('yyyy').format(selectedDate.toLocal());
    });
  }

  Future<Null> selectDate1(BuildContext context) async {

    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate1 = DateFormat('dd-MMM-yyyy').format(selectedDate.toLocal());
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        16.height,
                        Positioned(
                          top: 16,
                          left: MediaQuery.of(context).size.width*0.35,
                            child: Text('Add New Vehicle', style: boldTextStyle(color: white.withOpacity(0.8))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            56.height,
                            TextField(
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(

                                hintText: "Vehicle Name",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            TextField(
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Vehicle Number",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            GestureDetector(
                              onTap: (){
                                selectDate(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20,left: 12),
                                width: context.width(),
                                height: context.width()*0.15,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Text(mSelectedDate,
                                  style: primaryTextStyle(color: white.withOpacity(0.7),),

                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Vehicle Loading Capacity",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,

                            Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: Tirpal,
                                  dropdownColor: secondaryColor,
                                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                                  items: <String>['Select Tirpal', 'Available', 'Not-Available'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child:
                                      Text(value, style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      Tirpal = newValue!;
                                    });
                                  },
                                ),
                              ).paddingLeft(16),
                            ),
                            16.height,
                            Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: Daala,
                                  dropdownColor: secondaryColor,
                                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                                  items: <String>['Select Daala', 'With Daala', 'Without Daala'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child:
                                      Text(value, style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      Daala = newValue!;
                                    });
                                  },
                                ),
                              ).paddingLeft(16),
                            ),
                            16.height,
                            GestureDetector(
                              onTap: (){
                                selectDate1(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20,left: 12),
                                width: context.width(),
                                height: context.width()*0.15,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Text(mSelectedDate1,
                                  style: primaryTextStyle(color: white.withOpacity(0.7),),

                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Fitness Valid",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Permit Detail",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            Row(
                              children: [
                                Container(

                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  margin: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(

                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(

                                            padding: EdgeInsets.all(defaultPadding * 0.75),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: DBPrimaryColor.withOpacity(0.1),
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),

                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/pdf_file.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Vehicle Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(defaultPadding * 0.75),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: DBPrimaryColor.withOpacity(0.1),
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/pdf_file.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'RC Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  margin: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(defaultPadding * 0.75),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: DBPrimaryColor.withOpacity(0.1),
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/pdf_file.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Permit Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(defaultPadding * 0.75),
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                              color: DBPrimaryColor.withOpacity(0.1),
                                              borderRadius: const BorderRadius.all(Radius.circular(10)),
                                            ),
                                            child: SvgPicture.asset(
                                              'assets/icons/pdf_file.svg',
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Insurance Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            dbAppButtonWidget(context, 'Submit',
                              () {
                                setState(() {

                                });
                              },
                            ),
                          ],
                        ).paddingOnly(left: 16, right: 16, bottom: 16),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: Icon(Icons.close, color: DBSecondaryColor,).onTap(() {
                            finish(context);
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}


class EditVehicleDetail extends StatefulWidget {

  @override
  EditVehicleDetailState createState() => EditVehicleDetailState();
}

class EditVehicleDetailState extends State<EditVehicleDetail> {
  String Tirpal = 'Select Tirpal';
  String Daala = 'Select Daala';

  var mSelectedDate = 'Vehicle Model Year';
  var mSelectedDate1 = 'Insurance Valid Till';
  DateTime selectedDate = DateTime.now();

  Future<Null> selectDate(BuildContext context) async {

    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate = DateFormat('yyyy').format(selectedDate.toLocal());
    });
  }

  Future<Null> selectDate1(BuildContext context) async {

    final DateTime? picked = await showDatePicker(context: context, initialDate: selectedDate, firstDate: DateTime(1947), lastDate: DateTime(2501),);
    setState(() {
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
      mSelectedDate1 = DateFormat('dd-MMM-yyyy').format(selectedDate.toLocal());
    });
  }

  @override
  void initState() {
    super.initState();
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        16.height,
                        Positioned(
                          top: 16,
                          left: MediaQuery.of(context).size.width*0.35,
                            child: Text('New Vehicle', style: boldTextStyle(color: white.withOpacity(0.8))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            56.height,
                            TextField(
                              controller: TextEditingController()..text = 'Sumo Gold',
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(

                                hintText: "Vehicle Name",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            TextField(
                              controller: TextEditingController()..text = 'CG04NA0000',
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Vehicle Number",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            GestureDetector(
                              onTap: (){
                                selectDate(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20,left: 12),
                                width: context.width(),
                                height: context.width()*0.15,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Text(mSelectedDate,
                                  style: primaryTextStyle(color: white.withOpacity(0.7),),

                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              controller: TextEditingController()..text = '1.7 Ton',
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Vehicle Loading Capacity",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: Tirpal,
                                  dropdownColor: secondaryColor,
                                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                                  items: <String>['Select Tirpal', 'Available', 'Not-Available'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child:
                                      Text(value, style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      Tirpal = newValue!;
                                    });
                                  },
                                ),
                              ).paddingLeft(16),
                            ),
                            16.height,
                            Container(
                              height:60,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),

                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: Daala,
                                  dropdownColor: secondaryColor,
                                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.white),
                                  items: <String>['Select Daala', 'With Daala', 'Without Daala'].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child:
                                      Text(value, style: primaryTextStyle(color: Colors.white.withOpacity(0.7))),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      Daala = newValue!;
                                    });
                                  },
                                ),
                              ).paddingLeft(16),
                            ),
                            16.height,

                            GestureDetector(
                              onTap: (){
                                selectDate1(context);
                              },
                              child: Container(
                                padding: EdgeInsets.only(top: 20,left: 12),
                                width: context.width(),
                                height: context.width()*0.15,
                                decoration: BoxDecoration(
                                  color: secondaryColor,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10)),
                                ),
                                child: Text(mSelectedDate1,
                                  style: primaryTextStyle(color: white.withOpacity(0.7),),

                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              controller: TextEditingController()..text = 'Yes',
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Fitness Valid",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            TextField(

                              controller: TextEditingController()..text = 'XXXXXXXXX',
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Permit Detail",
                                hintStyle: TextStyle(color: white.withOpacity(0.5)),
                                fillColor: secondaryColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                            16.height,
                            Row(
                              children: [
                                Container(

                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  margin: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(

                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network("https://cdn.autoportal.com/img/news/11894/gallery/crop/de20419de5ffc46c696b55119502f41e.jpg"),
                                      Text(
                                        'Vehicle Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network("https://content3.jdmagicbox.com/comp/nashik/k3/0253px253.x253.181221160304.d4k3/catalogue/modern-pick-up-body-builders-and-engineering-works-pvt-ltd-co-satana-nashik-car-repair-and-services-1qgxrftk1i.jpg?clr=333333"),
                                      Text(
                                        'RC Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            Row(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  margin: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network("https://usedcarsnearme.com/wp-content/uploads/sites/14/2021/02/Chevrolet-Silverado.jpg"),
                                      Text(
                                        'Permit Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  padding: EdgeInsets.all(defaultPadding),
                                  decoration: BoxDecoration(
                                    color: secondaryColor,
                                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Image.network("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-chevrolet-silverado-zr2-004-1631132488.jpg?crop=0.874xw:0.875xh;0.0748xw,0.0587xh&resize=640:*"),
                                      Text(
                                        'Insurance Photo',
                                        style: primaryTextStyle(color: white.withOpacity(0.8)),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            16.height,
                            dbAppButtonWidget(context, 'Submit',
                              () {
                                setState(() {

                                });
                              },
                            ),
                          ],
                        ).paddingOnly(left: 16, right: 16, bottom: 16),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: Icon(Icons.close, color: DBSecondaryColor,).onTap(() {
                            finish(context);
                          }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        ),
      ),
    );
  }
}
