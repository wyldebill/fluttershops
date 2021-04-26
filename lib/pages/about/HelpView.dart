import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       
        Text(
          "Graphic icons from www.vecteezy.com/free-vector",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
       
        const Padding(
          padding: EdgeInsets.all(16.0),
         
        ),
        ElevatedButton(
          onPressed: () => {_launchInBrowser('https://wyldebill.github.io/Buffalo-Retail-Group-Privacy-Policy')},
          child: const Text('Privacy Policy'),
        ),
      ],
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }
}
