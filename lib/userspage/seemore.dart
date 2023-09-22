import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class seemore extends StatefulWidget {
  const seemore({Key? key}) : super(key: key);

  @override
  State<seemore> createState() => _seemoreState();
}

class _seemoreState extends State<seemore> {
  Future<void>? _launched;

  @override
  Widget build(BuildContext context) {
    final Uri toCatch = Uri(
      scheme: 'https',
      host: 'www.helpinghands-team.org',
      path: '',
    );
    final Uri toFetch = Uri(
      scheme: 'https',
      host: 'www.kanoongpt.in',
      path: '',
    );
    //https://indiaesevakendra.in/e-seva-kendra/
    final Uri toPetch = Uri(
      scheme: 'https',
      host: 'indiaesevakendra.in',
      path: 'e-seva-kendra',
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Clickable Cards'),
      ),
      body: ListView(
        children: [
          GestureDetector(

              onTap: () => setState(() {
                _launched = _launchInWebViewOrVC(toFetch);
              },
              ),
              child: Card(
                borderOnForeground: true,
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                  child:Column(
                    children: [
                      Text("KanoonGpt"),


                  Text("The Online Bare Acts Library is a comprehensive platform for Indian legislation and law. It aims to simplify legal research and make it accessible to a wide audience, including legal professionals and law students. The platform offers an extensive collection of Bare Acts, making it a valuable resource for anyone looking to gain a deeper understanding of Indian law. ")    ], ),
                ),
              )
          ),
          GestureDetector(

              onTap: () => setState(() {
                _launched = _launchInWebViewOrVC(toCatch);
              },
              ),
              child: Card(
                borderOnForeground: true,
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                  child:Column(
                    children: [
                      Text("Helping Hand"),


Text(" description: 'Helping Hands is an initiative to provide basic school and higher education to deserving students who are reasonably good in their studies andhas interest in continuing their higher education, there by improving the status of their family to the next level in the society.We support the students for both schools and colleges.'")
    ]))
    ),

    ),
          GestureDetector(

              onTap: () => setState(() {
                _launched = _launchInWebViewOrVC(toPetch);
              },
              ),
              child: Card(
                borderOnForeground: true,
                margin: EdgeInsets.all(10),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8), // Adjust the border radius as needed
                  child:Column(
                    children: [
                      Text("e-SEWA KENDRA"),
Text("            description: 'e-Sewa Kendras have been created in the High Courts and in one District Court in each State on a pilot basis. It enables litigants to obtain information with respect to case status and to obtain copies of judgments and orders. These centres also extend assistance in e-filing of cases. These Kendras represent a significant step for the common man and his right to access to justice.',")
                ]))
    )



          )
        ],
      ),
    );
  }
}

class ClickableCard extends StatelessWidget {
  final String title;
  final String description;

  const ClickableCard({
    required this.title,
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleCardClick(context);
      },
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(16),
        child: ListTile(
          title: Text(title),
          subtitle: Text(description),
        ),
      ),
    );
  }

  void _handleCardClick(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Card Clicked'),
          content: Text('You clicked on: $title'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
Future<void> _launchInWebViewOrVC(Uri url) async {
  if (!await launchUrl(url, mode: LaunchMode.inAppWebView)) {
    throw Exception('Could not launch $url');
  }
}