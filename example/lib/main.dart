import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getflutter/getflutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetFlutter',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
      );
}

//
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _playStoreLink =
      'https://play.google.com/store/apps/details?id=dev.getflutter.appkit';
  // final String _appStoreLink = 'Coming Soon';
  final String _githuAppRepoLink =
      'https://github.com/ionicfirebaseapp/getflutter-app-kit';
  final String _githubLibraryRepoLink =
      'https://github.com/ionicfirebaseapp/getflutter';

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
            InkWell(
              onTap: () {
                _launchUrl(_githubLibraryRepoLink);
              },
              child: SvgPicture.asset('lib/assets/logo.svg'),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'To keep library size small and code clean we manage example on different repository. which includes clear usage of each and every component that we provide in GetFlutter library. Please have a look there.',
                      style: TextStyle(
                        fontSize: 16,
                        color: GFColors.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GFButton(
                    size: GFSize.LARGE,
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
                      _launchUrl(_githuAppRepoLink);
                    }),
              ],
            ),
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(bottom: 25),
                  child: Center(
                    child: Text(
                      'We also have same app on playstore. It shows various possibilities that you can achieve using GetFlutter library.',
                      style: TextStyle(
                        fontSize: 16,
                        color: GFColors.WHITE,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                GFButton(
                    size: GFSize.LARGE,
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
                      _launchUrl(_playStoreLink);
                    }),
              ],
            ),
          ],
        ),
      );
}
