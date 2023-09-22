import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class OpenUrlDemo extends StatelessWidget {

  _launchURLBrowser() async {
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURLApp() async {
    const url = 'https://flutterdevs.com/';
    if (await canLaunch(url)) {
      await launch(url, forceSafariVC: true, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: Text('Flutter Open Url Demo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: deprecated_member_use
            ElevatedButton(

              onPressed: _launchURLBrowser,
              child: Text('Press Url Browser',style: TextStyle(color: Colors.white),),
            ),
            SizedBox(height: 8,),
            // ignore: deprecated_member_use
            ElevatedButton(

              onPressed: _launchURLApp,

              child: Text('Press Url App',style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}