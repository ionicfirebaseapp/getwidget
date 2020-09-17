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
          child: new MultiSelect(
            autovalidate: true,
            initialValue: ['IN', 'US'],
            titleText: 'Country of Residence',
            maxLength: 5, // optional
            validator: (dynamic value) {
              if (value == null) {
                return 'Please select one or more option(s)';
              }
              return null;
            },
            errorText: 'Please select one or more option(s)',
            dataSource: [
              {"name": "Afghanistan", "code": "AF"},
              {"name": "Åland Islands", "code": "AX"},
              {"name": "Albania", "code": "AL"},
              {"name": "Algeria", "code": "DZ"},
              {"name": "American Samoa", "code": "AS"},
              {"name": "AndorrA", "code": "AD"},
              {"name": "Angola", "code": "AO"},
              {"name": "Anguilla", "code": "AI"},
              {"name": "Antarctica", "code": "AQ"},
              {"name": "Antigua and Barbuda", "code": "AG"},
              {"name": "Argentina", "code": "AR"},
              {"name": "Armenia", "code": "AM"},
              {"name": "Aruba", "code": "AW"},
              {"name": "Australia", "code": "AU"},
              {"name": "Austria", "code": "AT"},
              {"name": "Azerbaijan", "code": "AZ"},
              {"name": "Bahamas", "code": "BS"},
              {"name": "Bahrain", "code": "BH"},
              {"name": "Bangladesh", "code": "BD"},
              {"name": "Barbados", "code": "BB"},
              {"name": "Belarus", "code": "BY"},
              {"name": "Belgium", "code": "BE"},
              {"name": "Belize", "code": "BZ"},
              {"name": "Benin", "code": "BJ"},
              {"name": "Bermuda", "code": "BM"},
              {"name": "Bhutan", "code": "BT"},
              {"name": "Bolivia", "code": "BO"},
              {"name": "Bosnia and Herzegovina", "code": "BA"},
              {"name": "Botswana", "code": "BW"},
              {"name": "Bouvet Island", "code": "BV"},
              {"name": "Brazil", "code": "BR"},
              {"name": "British Indian Ocean Territory", "code": "IO"},
              {"name": "Brunei Darussalam", "code": "BN"},
              {"name": "Bulgaria", "code": "BG"},
              {"name": "Burkina Faso", "code": "BF"},
              {"name": "Burundi", "code": "BI"},
              {"name": "Cambodia", "code": "KH"},
              {"name": "Cameroon", "code": "CM"},
              {"name": "Canada", "code": "CA"},
              {"name": "Cape Verde", "code": "CV"},
              {"name": "Cayman Islands", "code": "KY"},
              {"name": "Central African Republic", "code": "CF"},
              {"name": "Chad", "code": "TD"},
              {"name": "Chile", "code": "CL"},
              {"name": "China", "code": "CN"},
              {"name": "Christmas Island", "code": "CX"},
              {"name": "Cocos (Keeling) Islands", "code": "CC"},
              {"name": "Colombia", "code": "CO"},
              {"name": "Comoros", "code": "KM"},
              {"name": "Congo", "code": "CG"},
              {"name": "Congo, The Democratic Republic of the", "code": "CD"},
              {"name": "Cook Islands", "code": "CK"},
              {"name": "Costa Rica", "code": "CR"},
              {"name": "Cote D\'Ivoire", "code": "CI"},
              {"name": "Croatia", "code": "HR"},
              {"name": "Cuba", "code": "CU"},
              {"name": "Cyprus", "code": "CY"},
              {"name": "Czech Republic", "code": "CZ"},
              {"name": "Denmark", "code": "DK"},
              {"name": "Djibouti", "code": "DJ"},
              {"name": "Dominica", "code": "DM"},
              {"name": "Dominican Republic", "code": "DO"},
              {"name": "Ecuador", "code": "EC"},
              {"name": "Egypt", "code": "EG"},
              {"name": "El Salvador", "code": "SV"},
              {"name": "Equatorial Guinea", "code": "GQ"},
              {"name": "Eritrea", "code": "ER"},
              {"name": "Estonia", "code": "EE"},
              {"name": "Ethiopia", "code": "ET"},
              {"name": "Falkland Islands (Malvinas)", "code": "FK"},
              {"name": "Faroe Islands", "code": "FO"},
              {"name": "Fiji", "code": "FJ"},
              {"name": "Finland", "code": "FI"},
              {"name": "France", "code": "FR"},
              {"name": "French Guiana", "code": "GF"},
              {"name": "French Polynesia", "code": "PF"},
              {"name": "French Southern Territories", "code": "TF"},
              {"name": "Gabon", "code": "GA"},
              {"name": "Gambia", "code": "GM"},
              {"name": "Georgia", "code": "GE"},
              {"name": "Germany", "code": "DE"},
              {"name": "Ghana", "code": "GH"},
              {"name": "Gibraltar", "code": "GI"},
              {"name": "Greece", "code": "GR"},
              {"name": "Greenland", "code": "GL"},
              {"name": "Grenada", "code": "GD"},
              {"name": "Guadeloupe", "code": "GP"},
              {"name": "Guam", "code": "GU"},
              {"name": "Guatemala", "code": "GT"},
              {"name": "Guernsey", "code": "GG"},
              {"name": "Guinea", "code": "GN"},
              {"name": "Guinea-Bissau", "code": "GW"},
              {"name": "Guyana", "code": "GY"},
              {"name": "Haiti", "code": "HT"},
              {"name": "Heard Island and Mcdonald Islands", "code": "HM"},
              {"name": "Holy See (Vatican City State)", "code": "VA"},
              {"name": "Honduras", "code": "HN"},
              {"name": "Hong Kong", "code": "HK"},
              {"name": "Hungary", "code": "HU"},
              {"name": "Iceland", "code": "IS"},
              {"name": "India", "code": "IN"},
              {"name": "Indonesia", "code": "ID"},
              {"name": "Iran, Islamic Republic Of", "code": "IR"},
              {"name": "Iraq", "code": "IQ"},
              {"name": "Ireland", "code": "IE"},
              {"name": "Isle of Man", "code": "IM"},
              {"name": "Israel", "code": "IL"},
              {"name": "Italy", "code": "IT"},
              {"name": "Jamaica", "code": "JM"},
              {"name": "Japan", "code": "JP"},
              {"name": "Jersey", "code": "JE"},
              {"name": "Jordan", "code": "JO"},
              {"name": "Kazakhstan", "code": "KZ"},
              {"name": "Kenya", "code": "KE"},
              {"name": "Kiribati", "code": "KI"},
              {"name": "Korea, Democratic People\'s Republic of", "code": "KP"},
              {"name": "Korea, Republic of", "code": "KR"},
              {"name": "Kuwait", "code": "KW"},
              {"name": "Kyrgyzstan", "code": "KG"},
              {"name": "Lao People\'s Democratic Republic", "code": "LA"},
              {"name": "Latvia", "code": "LV"},
              {"name": "Lebanon", "code": "LB"},
              {"name": "Lesotho", "code": "LS"},
              {"name": "Liberia", "code": "LR"},
              {"name": "Libyan Arab Jamahiriya", "code": "LY"},
              {"name": "Liechtenstein", "code": "LI"},
              {"name": "Lithuania", "code": "LT"},
              {"name": "Luxembourg", "code": "LU"},
              {"name": "Macao", "code": "MO"},
              {
                "name": "Macedonia, The Former Yugoslav Republic of",
                "code": "MK"
              },
              {"name": "Madagascar", "code": "MG"},
              {"name": "Malawi", "code": "MW"},
              {"name": "Malaysia", "code": "MY"},
              {"name": "Maldives", "code": "MV"},
              {"name": "Mali", "code": "ML"},
              {"name": "Malta", "code": "MT"},
              {"name": "Marshall Islands", "code": "MH"},
              {"name": "Martinique", "code": "MQ"},
              {"name": "Mauritania", "code": "MR"},
              {"name": "Mauritius", "code": "MU"},
              {"name": "Mayotte", "code": "YT"},
              {"name": "Mexico", "code": "MX"},
              {"name": "Micronesia, Federated States of", "code": "FM"},
              {"name": "Moldova, Republic of", "code": "MD"},
              {"name": "Monaco", "code": "MC"},
              {"name": "Mongolia", "code": "MN"},
              {"name": "Montserrat", "code": "MS"},
              {"name": "Morocco", "code": "MA"},
              {"name": "Mozambique", "code": "MZ"},
              {"name": "Myanmar", "code": "MM"},
              {"name": "Namibia", "code": "NA"},
              {"name": "Nauru", "code": "NR"},
              {"name": "Nepal", "code": "NP"},
              {"name": "Netherlands", "code": "NL"},
              {"name": "Netherlands Antilles", "code": "AN"},
              {"name": "New Caledonia", "code": "NC"},
              {"name": "New Zealand", "code": "NZ"},
              {"name": "Nicaragua", "code": "NI"},
              {"name": "Niger", "code": "NE"},
              {"name": "Nigeria", "code": "NG"},
              {"name": "Niue", "code": "NU"},
              {"name": "Norfolk Island", "code": "NF"},
              {"name": "Northern Mariana Islands", "code": "MP"},
              {"name": "Norway", "code": "NO"},
              {"name": "Oman", "code": "OM"},
              {"name": "Pakistan", "code": "PK"},
              {"name": "Palau", "code": "PW"},
              {"name": "Palestinian Territory, Occupied", "code": "PS"},
              {"name": "Panama", "code": "PA"},
              {"name": "Papua New Guinea", "code": "PG"},
              {"name": "Paraguay", "code": "PY"},
              {"name": "Peru", "code": "PE"},
              {"name": "Philippines", "code": "PH"},
              {"name": "Pitcairn", "code": "PN"},
              {"name": "Poland", "code": "PL"},
              {"name": "Portugal", "code": "PT"},
              {"name": "Puerto Rico", "code": "PR"},
              {"name": "Qatar", "code": "QA"},
              {"name": "Reunion", "code": "RE"},
              {"name": "Romania", "code": "RO"},
              {"name": "Russian Federation", "code": "RU"},
              {"name": "RWANDA", "code": "RW"},
              {"name": "Saint Helena", "code": "SH"},
              {"name": "Saint Kitts and Nevis", "code": "KN"},
              {"name": "Saint Lucia", "code": "LC"},
              {"name": "Saint Pierre and Miquelon", "code": "PM"},
              {"name": "Saint Vincent and the Grenadines", "code": "VC"},
              {"name": "Samoa", "code": "WS"},
              {"name": "San Marino", "code": "SM"},
              {"name": "Sao Tome and Principe", "code": "ST"},
              {"name": "Saudi Arabia", "code": "SA"},
              {"name": "Senegal", "code": "SN"},
              {"name": "Serbia and Montenegro", "code": "CS"},
              {"name": "Seychelles", "code": "SC"},
              {"name": "Sierra Leone", "code": "SL"},
              {"name": "Singapore", "code": "SG"},
              {"name": "Slovakia", "code": "SK"},
              {"name": "Slovenia", "code": "SI"},
              {"name": "Solomon Islands", "code": "SB"},
              {"name": "Somalia", "code": "SO"},
              {"name": "South Africa", "code": "ZA"},
              {
                "name": "South Georgia and the South Sandwich Islands",
                "code": "GS"
              },
              {"name": "Spain", "code": "ES"},
              {"name": "Sri Lanka", "code": "LK"},
              {"name": "Sudan", "code": "SD"},
              {"name": "Suriname", "code": "SR"},
              {"name": "Svalbard and Jan Mayen", "code": "SJ"},
              {"name": "Swaziland", "code": "SZ"},
              {"name": "Sweden", "code": "SE"},
              {"name": "Switzerland", "code": "CH"},
              {"name": "Syrian Arab Republic", "code": "SY"},
              {"name": "Taiwan, Province of China", "code": "TW"},
              {"name": "Tajikistan", "code": "TJ"},
              {"name": "Tanzania, United Republic of", "code": "TZ"},
              {"name": "Thailand", "code": "TH"},
              {"name": "Timor-Leste", "code": "TL"},
              {"name": "Togo", "code": "TG"},
              {"name": "Tokelau", "code": "TK"},
              {"name": "Tonga", "code": "TO"},
              {"name": "Trinidad and Tobago", "code": "TT"},
              {"name": "Tunisia", "code": "TN"},
              {"name": "Turkey", "code": "TR"},
              {"name": "Turkmenistan", "code": "TM"},
              {"name": "Turks and Caicos Islands", "code": "TC"},
              {"name": "Tuvalu", "code": "TV"},
              {"name": "Uganda", "code": "UG"},
              {"name": "Ukraine", "code": "UA"},
              {"name": "United Arab Emirates", "code": "AE"},
              {"name": "United Kingdom", "code": "GB"},
              {"name": "United States", "code": "US"},
              {"name": "United States Minor Outlying Islands", "code": "UM"},
              {"name": "Uruguay", "code": "UY"},
              {"name": "Uzbekistan", "code": "UZ"},
              {"name": "Vanuatu", "code": "VU"},
              {"name": "Venezuela", "code": "VE"},
              {"name": "Viet Nam", "code": "VN"},
              {"name": "Virgin Islands, British", "code": "VG"},
              {"name": "Virgin Islands, U.S.", "code": "VI"},
              {"name": "Wallis and Futuna", "code": "WF"},
              {"name": "Western Sahara", "code": "EH"},
              {"name": "Yemen", "code": "YE"},
              {"name": "Zambia", "code": "ZM"},
              {"name": "Zimbabwe", "code": "ZW"}
            ],
            textField: 'name',
            valueField: 'code',
            filterable: true,
            required: true,
            onSaved: (value) {
              print('The value is $value');
            },
            selectIcon: Icons.arrow_drop_down_circle,
            saveButtonColor: Theme.of(context).primaryColor,
            checkBoxColor: Theme.of(context).primaryColorDark,
            cancelButtonColor: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
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
