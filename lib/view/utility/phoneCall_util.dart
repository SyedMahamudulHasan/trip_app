import 'package:url_launcher/url_launcher.dart';

Future<void> launchPhoneDialer(String contactNumber) async {
  final Uri _phoneUri = await Uri(scheme: "tel", path: contactNumber);
  try {
    if (await canLaunchUrl(_phoneUri)) {
      await launchUrl(_phoneUri);
    }
  } catch (error) {
    throw ("Cannot dial");
  }
}

void launchEmail(String email) async {
  final Uri url = Uri(
    scheme: 'mailto',
    path: email,
  );

  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw "Can connect with $url";
  }
}
