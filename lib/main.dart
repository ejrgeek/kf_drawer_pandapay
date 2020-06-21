import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kfdrawer/screens/site_page.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kf_drawer/kf_drawer.dart';
import 'package:kfdrawer/screens/cash_in_page.dart';
import 'package:kfdrawer/screens/help_page.dart';
import 'package:kfdrawer/screens/invite_friends_page.dart';

import 'screens/auth_page.dart';
import 'screens/home_page.dart';
import 'screens/tax_page.dart';
import 'utils/class_builder.dart';


void main() {
  ClassBuilder.registerClasses();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainWidget(),
    );
  }
}

class MainWidget extends StatefulWidget {
  MainWidget({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ClassBuilder.fromString('HomePage'),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('HomePage', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: HomePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text('Taxas', style: TextStyle(color: Colors.white)),
          icon: SvgPicture.asset('assets/tax-icon.svg'),
          page: TaxPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Cobrar',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/cash-in-icon.svg'),
          page: CashInPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Convidar amigos',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/invite-friends-icon.svg'),
          page: InviteFriendsPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Nosso site',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/site-icon.svg'),
          page: SitePage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Ajuda',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.help_outline, color: Colors.white),
          page: HelpPage(),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
              height: 30,
              width: MediaQuery.of(context).size.width * 0.5,
              child: SvgPicture.asset(
                'assets/logo_horizontal.svg',
                color: Colors.white,
              )
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'Sair',
            style: TextStyle(color: Colors.white),
          ),
          icon: SvgPicture.asset('assets/exit-icon.svg'),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return AuthPage();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.black, Colors.black],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}