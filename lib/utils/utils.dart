import 'package:apparatus_wallet/utils/snackbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

String formatTimestamp(DateTime timestamp) {
  final now = DateTime.now();
  final difference = now.difference(timestamp);

  if (difference.inSeconds < 60) {
    return 'Fetched just now';
  } else if (difference.inMinutes < 60) {
    return 'Fetched ${difference.inMinutes} minute(s) ago';
  } else if (difference.inHours < 24) {
    return 'Fetched ${difference.inHours} hour(s) ago';
  } else if (difference.inDays < 7) {
    return 'Fetched ${difference.inDays} day(s) ago';
  } else {
    // If more than a week ago, just show the date
    return 'Fetched on ${DateFormat.yMMMd().format(timestamp)}';
  }
}

Future<void> launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    throw 'Could not launch $url';
  }
}

// is debug mode - Placeholder if we ever need more complex logic,
// technically this only checks if we're not in release mode which is not the same
bool get isDebugMode => !kReleaseMode;

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) return input;
  return input[0].toUpperCase() + input.substring(1);
}

