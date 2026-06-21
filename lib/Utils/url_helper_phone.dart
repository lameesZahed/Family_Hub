import 'package:url_launcher/url_launcher.dart';

Future<void> makePhoneCall(String phoneNumber) async {
  // The 'tel:' prefix tells the OS to open the dialer
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );

  if (await canLaunchUrl(launchUri)) {
    await launchUrl(launchUri);
  } else {
    // This handles cases like tablets without a phone app
    print("Could not launch dialer for $phoneNumber");
  }
}