import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Our Project Makers',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                  'Vestibulum nec urna eu neque faucibus fermentum. '
                  'Praesent non justo eu justo suscipit malesuada.',
            ),
            SizedBox(height: 16),
            Text(
              'Contact Customer Support',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'If you need assistance or have any questions, please feel free to contact our customer support team.',
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                // Define the email address you want to send the email to
                final email = 'customersupport@example.com';

                // Define the subject and body of the email (you can customize them)
                final subject = 'Support Request';
                final body = 'Hello, I need assistance with the following issue: ';

                // Create the mailto URI
                final uri = Uri(
                  scheme: 'mailto',
                  path: email,
                  queryParameters: {
                    'subject': subject,
                    'body': body,
                  },
                );

                // Launch the email app with the pre-filled email
                if (await canLaunch(uri.toString())) {
                  await launch(uri.toString());
                } else {
                  // Handle error (e.g., the email app is not installed)
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Could not open the email app.'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: Text('Contact Customer Support'),
            )

          ],
        ),
      ),
    );
  }
}
Future<void> _sendEmail(String email) async {
  final Uri launchUri = Uri(
    scheme: 'mailto',
    path: email,
  );
  await launchUrl(launchUri);
}
