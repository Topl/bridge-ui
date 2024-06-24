import 'package:intl/intl.dart';

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
