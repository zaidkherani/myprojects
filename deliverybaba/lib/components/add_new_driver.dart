import 'dart:convert';

import 'package:db_merchant_app/utils/DBColors.dart';
import 'package:db_merchant_app/utils/DBConstants.dart';
import 'package:db_merchant_app/utils/DBWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nb_utils/nb_utils.dart';


class AddNewDriver extends StatefulWidget {

  @override
  AddNewDriverState createState() => AddNewDriverState();
}

class AddNewDriverState extends State<AddNewDriver> {

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
                          left: MediaQuery.of(context).size.width*0.37,
                            child: Text('Add New Driver', style: boldTextStyle(color: white.withOpacity(0.8))),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            56.height,
                            TextField(
                              style: TextStyle(color: white.withOpacity(0.7)),
                              decoration: InputDecoration(
                                hintText: "Driver Name",
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
                                hintText: "Driver Mobile Number",
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
                                hintText: "Emergency Number",
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
                                        'Driver Photo',
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
                                        'Driving License Photo',
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



class EditDriverDetail extends StatefulWidget {

  @override
  EditDriverDetailState createState() => EditDriverDetailState();
}

class EditDriverDetailState extends State<EditDriverDetail> {

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
                      left: MediaQuery.of(context).size.width*0.37,
                      child: Text('New Driver', style: boldTextStyle(color: white.withOpacity(0.8))),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        56.height,
                        TextField(
                          controller: TextEditingController()..text = 'Vijay',
                          // textInputAction: ,
                          style: TextStyle(color: white.withOpacity(0.7)),
                          decoration: InputDecoration(
                            hintText: "Vijay",
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
                          controller: TextEditingController()..text = '+91-8771292380',
                          style: TextStyle(color: white.withOpacity(0.7)),
                          decoration: InputDecoration(
                            hintText: "Driver Mobile Number",
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
                          controller: TextEditingController()..text = '+91-8771292380',
                          style: TextStyle(color: white.withOpacity(0.7)),
                          decoration: InputDecoration(
                            hintText: "Emergency Number",
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
                          controller: TextEditingController()..text = 'Pik-up 1.7 T',
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
                                  Image.network("https://www.onelap.in/news/wp-content/uploads/2020/04/Bolero-pickup-featured-image.png"),
                                  Text(
                                    'Driver Photo',
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
                                  Image.network("http://bsmedia.business-standard.com/_media/bs/img/article/2015-03/23/full/1427125553-3925.jpg"),
                                  Text(
                                    'Driving License Photo',
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
