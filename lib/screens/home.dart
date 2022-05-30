// ignore_for_file: unnecessary_this

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_app/model/package.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  List<Packages>? packlist;

  bool packfetch = false;
  var finaldata;
  bool finaldatafetch = false;

  Future<void> apicall() async {
    var url = "http://cgprojects.in/flutter/";
    var result = await http.get(Uri.parse(url));
    var data = jsonDecode(result.body);
    finaldata = data['current_bookings'];
    var pack = data['packages'];
    packlist = [];
    try {
      assert(pack is List);
      for (int i = 0; i < pack.length; i++) {
        packlist?.add(Packages.fromJson(pack[i]));
      }
      packfetch = true;
      if (this.mounted) setState(() {});
    } catch (e) {
      print(e);
    }
    finaldatafetch = true;
    if (this.mounted) setState(() {});
  }

  openEndDrawer() {}

  @override
  void initState() {
    // TODO: implement initState
    apicall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 38.0, right: 38),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 40,
                    child: Image.asset('assets/profile.png'),
                    backgroundColor: Color(0xffE36DA6),
                  ),
                ),
                Center(
                  child: Text(
                    'Emily Syrus',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xffE36DA6)),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Book A Nanny',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'How it Works',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Why nanny vanny',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'My Booking',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'My profile',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
                Divider(
                  color: Color(0xffE36DA6),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Support',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Color(0xff262F71)),
                ),
              ],
            ),
          ),
        ),
      ),
      key: scaffoldKey,
      body: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Container()),
                  InkWell(
                    onTap: () {
                      scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/drawer.png'))),
                    ),
                  )
                ],
              ),
              //elevation: 20.0,
              //semanticLabel: 'endDrawer',

              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Icon(Icons.menu),
              // ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/profile.png'))),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Column(
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Emily cysus',
                            style: TextStyle(
                                color: Color(0xffE36DA6),
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 49, right: 20),
                        padding: EdgeInsets.all(10),
                        height: 150,
                        // width: MediaQuery.of(context).size.width,
                        width: 330,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xffF5B5CF)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nancy and \nbabyitting services',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(70),
                                  color: Color(0xff262F71)),
                              height: 30,
                              width: 70,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Booknow',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  )),
                            )
                          ],
                        ),
                      ),
                      Positioned(
                          right: -17, child: Image.asset('assets/cartoon.png'))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Your Current Booking',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff262F71))),
              SizedBox(
                height: 20,
              ),
              finaldatafetch
                  ? Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          // shape: BoxShape.circle, // BoxShape.circle or BoxShape.retangle
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5.0,
                            ),
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 12,
                          bottom: 20,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "One Day Package",
                                  style: TextStyle(
                                      color: Color(0xffE36DA6),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Alegreya_Sans'),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(70),
                                      color: Color(0xffE36DA6)),
                                  height: 30,
                                  width: 70,
                                  child: TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Start',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 10),
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'From',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.calendar_month,
                                          color: Color(0xffE36DA6),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          finaldata['from_date'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Alegreya_Sans'),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.watch_later_outlined,
                                          color: Color(0xffE36DA6),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          finaldata['from_time'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              fontFamily: 'Alegreya_Sans'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 40),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'To',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.calendar_month,
                                            color: Color(0xffE36DA6),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            finaldata['to_date'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: 'Alegreya_Sans'),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: Color(0xffE36DA6),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            finaldata['to_time'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                fontFamily: 'Alegreya_Sans'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                but('Rate US', Icons.star_border),
                                but('Geolocation', Icons.location_on),
                                but('Surivillnce', Icons.mic_sharp),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  : Container(),
              SizedBox(
                height: 20,
              ),
              const Text('Packages',
                  style: TextStyle(
                      fontFamily: 'Alegreya_Sans',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff262F71))),
              packfetch
                  ? ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: packlist?.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Color(0xffF0B3CD)
                                    : Color(0xff80ABDB),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 20, left: 15, right: 15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.calendar_month,
                                        color: index % 2 == 0
                                            ? Color(0xffD84D90)
                                            : Colors.white,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(70),
                                            color: index % 2 == 0
                                                ? Color(0xffE36DA6)
                                                : Color(0xff0098D0)),
                                        height: 30,
                                        width: 100,
                                        child: TextButton(
                                            onPressed: () {},
                                            child: Text(
                                              'Book Now',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12),
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        packlist![index].packageName.toString(),
                                        style: TextStyle(
                                            fontFamily: 'Alegreya_Sans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '\u{20B9}${packlist![index].price.toString()}',
                                        style: TextStyle(
                                            fontFamily: 'Alegreya_Sans',
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    packlist![index].description.toString(),
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontFamily: 'Alegreya_Sans',
                                        color: index % 2 == 0
                                            ? Colors.black
                                            : Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      })
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget but(String title, IconData icons) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(70), color: Color(0xff262F71)),
      height: 30,
      width: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icons,
              size: 16,
              color: Colors.white,
            ),
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Alegreya_Sans'),
            )
          ],
        ),
      ),
    );
  }
}
