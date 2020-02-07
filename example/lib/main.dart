import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getflutter/getflutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'getflutter_EXAMPLE',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future _launchUrl(url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    }
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: GFColors.DARK,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset('lib/assets/logo.svg'),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                      style: TextStyle(
                        fontSize: 16,
                        color: GFColors.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GFButton(
                    size: GFSize.large,
                    text: 'View on Github',
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: GFColors.WHITE,
                    ),
                    icon: SvgPicture.asset(
                      'lib/assets/github.svg',
                      height: 22,
                    ),
                    color: GFColors.SUCCESS,
                    blockButton: true,
                    onPressed: () {
                      _launchUrl(
                          'https://github.com/ionicfirebaseapp/getflutter-app-kit');
                    }),
              ],
            ),
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do ',
                      style: TextStyle(
                        fontSize: 16,
                        color: GFColors.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GFButton(
                    size: GFSize.large,
                    text: 'View on Playstore',
                    textStyle:
                        const TextStyle(fontSize: 16, color: GFColors.WHITE),
                    icon: SvgPicture.asset(
                      'lib/assets/playstore.svg',
                      height: 20,
                    ),
                    color: GFColors.SUCCESS,
                    blockButton: true,
                    onPressed: () {
                      _launchUrl(
                          'https://play.google.com/store/apps/details?id=dev.getflutter.appkit');
                    }),
              ],
            ),
          ],
        ),
      );
}
