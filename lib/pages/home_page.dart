import 'dart:ui';

import 'package:Demo_Day/core/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConstants.backgroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                color: AppConstants.mainColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                ),
              ),
              padding: EdgeInsets.only(top: 0, bottom: 20),
              child: Stack(
                children: <Widget>[
                  _buildHeader(),
                ],
              ),
            ),
            SizedBox(height: 0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: RichText(
                text: TextSpan(
                  text: "Projects",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: MediaQuery.of(context).size.height - 250,
              child: ListView(
                scrollDirection: Axis.vertical,
                padding: EdgeInsets.only(left: 16),
                physics: BouncingScrollPhysics(),
                children: <Widget>[
                  _buildProjectItem(
                      context,
                      "assets/images/ishig.png", "ISHIQ",
                      "ISHIQ - Career beacon for all",
                      'http://demo.ishig.org/'
                  ),
                  _buildProjectItem(
                      context,
                      "assets/images/doget.png",
                      "DOGET",
                      "DOGET - A platform connecting professionals and customers in a minute",
                      'https://doget.pesekar.az'),
                  _buildProjectItem(
                      context,
                      "assets/images/abc.png", "ABC Planet",
                      "ABC Planet - Dualingo for pre-schoolers",
                      'https://abcplanet.org/'),
                  _buildProjectItem(
                      context,
                      "assets/images/winfi.png",
                      "WinFi",
                      "WinFi An app which brings Wi-Fi owners and Wi-Fi users together. It’s Uber for Wi-Fi",
                      'https://www.winfiapp.com'),
                  _buildProjectItem(
                    context,
                      "assets/images/aida.png",
                      "AIDAtoolkit",
                      "AIDAtoolkit - all-in-one content creation and collaboration tool",
                      'http://aidatoolkit.com'),
                ],
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectItem(
  BuildContext context, String path, String text, String desc, String url) {
    return Column(
      children: <Widget>[
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            border: Border.all(color: Colors.white),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(2, 3),
                spreadRadius: 1,
                blurRadius: 3,
              )
            ],
          ),
          padding: EdgeInsets.only(top: 15, right: 10, left: 10),
          child: Column(
            children: <Widget>[
              Image.asset(path, height: 65),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: Column(
                      children: <Widget>[
                        Text(
                          text,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            fontSize: 24,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          desc,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 20,
                            height: 1.2,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                ),
              ),
              _buildButton(context, url, AppConstants.btnBgColor, false),
            ],
          ),
          margin: EdgeInsets.only(right: 20),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String url, Color bgColor, bool gradient) {
    return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () async {
              if (await canLaunch(url)) {
                await launch(url, forceSafariVC: false);
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                gradient: LinearGradient(
                  colors: [
                    bgColor,
                    gradient ? AppConstants.btnBgGradientColor : bgColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                //border: Border.all(color: AppColors.btnBorderColor, width: .5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(1, 1),
                    spreadRadius: 1,
                    blurRadius: 3,
                  )
                ],
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Text(
                      "Go To Website ".toUpperCase(),
                      style: TextStyle(
                        color: AppConstants.btnTxtColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }


  Padding _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Align(
        alignment: Alignment.topCenter,
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}
