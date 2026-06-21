import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail(String emailAddress) async {
  final Uri emailLaunchUri = Uri(
    scheme: 'mailto',
    path: emailAddress,
    // You can also add subject or body if needed:
    queryParameters: {
      'subject': 'Support Request',
      'body': 'Hello Family Hub Team,'
    },
  );

  if (await canLaunchUrl(emailLaunchUri)) {
    await launchUrl(emailLaunchUri);
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}