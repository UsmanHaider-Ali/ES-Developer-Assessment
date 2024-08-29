import 'package:es_developer_assessment/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:connectivity/connectivity.dart';
import 'package:intl/intl.dart';

Future<bool> isConnectedToInternet() async {
  var connectivityResult = await Connectivity().checkConnectivity();
  return connectivityResult != ConnectivityResult.none;
}

String formatDateString(String dateString) {
  try {
    DateTime parsedDate = DateFormat("dd-MM-yy HH:mm:ss.SS").parse(dateString);
    return DateFormat("yyyy-MM-dd").format(parsedDate);
  } catch (e) {
    debugPrint("Error parsing date: $e");
    return "";
  }
}

extension GenreExtension on int {
  String? getGenreName() => Genre.getById(this)?.name;
}
