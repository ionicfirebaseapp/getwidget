import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:getwidget/getwidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'GetWidget',
        debugShowCheckedModeBanner: false,
        home: Textf(),
      );
}

class Textf extends StatefulWidget {
  @override
  _TextfState createState() => _TextfState();
}

class _TextfState extends State<Textf> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: GFDropdown(
              items: [],
              dropdownColor: Colors.red,
              value: _value,
              isExpanded: true,
              borderColor: Colors.blueGrey,
              padding: EdgeInsets.all(0),
              icon: Icon(Icons.home),
              isDense: true,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 70, left: 30, right: 30),
          child: DropdownButton(
              dropdownColor: Colors.red,
              value: _value,
              style: TextStyle(color: Colors.blue),
              iconEnabledColor: Colors.amber,
              iconDisabledColor: Colors.blueGrey,
              hint: Text('kijijm'),
              disabledHint: Text('cfgvhjn'),
              elevation: 4,
              autofocus: true,
              focusColor: Colors.orange,
              isExpanded: false,
              underline: Text('bjnmk'),
              isDense: true,
              iconSize: 50,
              icon: Icon(Icons.home),
              items: [
                DropdownMenuItem(
                  child: Text("First s"),
                  value: 1,
                ),
                DropdownMenuItem(
                  child: Text("Second"),
                  value: 2,
                ),
              ],
              onChanged: (value) {
                setState(() {
                  _value = value;
                });
              }),
        ),
      )
    ]));
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _playStoreLink =
      'https://play.google.com/store/apps/details?id=dev.getflutter.appkit';
  // final String _appStoreLink = 'Coming Soon';
  final String _githuAppRepoLink =
      'https://github.com/ionicfirebaseapp/getwidget-app-kit';
  final String _githubLibraryRepoLink =
      'https://github.com/ionicfirebaseapp/getwidget';

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
                      'To keep library size small and code clean we manage example on different repository. which includes clear usage of each and every component that we provide in GetWidget library. Please have a look there.',
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
                      'We also have same app on playstore. It shows various possibilities that you can achieve using GetWidget library.',
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
