import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneDialer(String contactNumber) async {
  final Uri _phoneUri = Uri(scheme: "tel", path: contactNumber);
  try {
    if (await canLaunchUrl(_phoneUri)) {
      await launchUrl(_phoneUri);
    }
  } catch (error) {
    throw ("Cannot dial");
  }
}
