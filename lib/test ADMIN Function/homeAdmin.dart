import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ice_durable_articles/src/color_strings.dart';
import 'package:ice_durable_articles/src/size_strings.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/followAdmin.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/historyAdminDetails.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/veriflyAllAdmin.dart';
import 'package:ice_durable_articles/test%20ADMIN%20Function/veriflyAdminDetailsUI.dart';

class HomeAdminUI extends StatefulWidget {
  const HomeAdminUI({super.key});

  @override
  State<HomeAdminUI> createState() => _HomeAdminUIState();
}

class _HomeAdminUIState extends State<HomeAdminUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Admin Home",
          style: TextStyle(color: Colors.white, fontSize: tMediumSize),
        ),
        backgroundColor: tRedColor,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                      
                        Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FollowStatusUserUI()));
                      },
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 0.92,
                        height: 200,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 6,
                              color: Color(0x4B1A1F24),
                              offset: Offset(0, 2),
                            )
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 223, 87, 29),
                              Color.fromARGB(255, 255, 214, 89),
                            ],
                            stops: [0, 1],
                            begin: Alignment.bottomRight,
                            end: Alignment.topLeft,
                            tileMode: TileMode.clamp,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text("ติดตามสถานะการใช้งาน",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                          fontSize: tMediumSize)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(200, 10, 0, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  // Container(
                                      // color: Colors.transparent,
                                      // decoration: BoxDecoration(
                                      //   image: DecorationImage(
                                      //     image: AssetImage(
                                      //       'assets/followstatus.jpg',
                                      //     ),
                                      //     fit: BoxFit.cover,
                                      //   ),
                                      // )),

                                  // fit: BoxFit.cover,

                                  Icon(
                                    CupertinoIcons.time,
                                    color: Colors.white,
                                    size: 110,
                                  )

                                  // CupertinoIcons.doc_text_search,
                                  // doc_text_search
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(
                height: 30,
                thickness: 1,
                indent: 20,
                endIndent: 20,
                color: Color(0xFFDBE2E7),
              ),
              GestureDetector(
                onTap: () {
                
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VeriflyAdmin()));
                          
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.92,
                  height: 200,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 6,
                        color: Color(0x4B1A1F24),
                        offset: Offset(0, 2),
                      )
                    ],
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 30, 14, 175),
                        Color.fromARGB(255, 193, 116, 238),
                      ],
                      stops: [0, 1],
                      begin: Alignment.bottomRight,
                      end: Alignment.topLeft,
                      tileMode: TileMode.clamp,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text("ตรวจสอบครุภัณฑ์",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: tMediumSize)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(200, 10, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            // Image.asset(
                            //   'assets/images/veriflyItem.png',
                            //   // width: 54,
                            //   // height: 54,
                            //   // fit: BoxFit.cover,
                            // ),
                            Icon(
                              CupertinoIcons.doc_text_search,
                              color: Colors.white,
                              size: 120,
                            )

                            // CupertinoIcons.doc_text_search,
                            // doc_text_search
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
