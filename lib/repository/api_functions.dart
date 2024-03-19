// Timer.periodic(new Duration(seconds: 1), (timer) {
//    debugPrint(timer.tick.toString());
// });
// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
// import 'dart:isolate';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:monitoring_system/logic/field_data_provider.dart';
import 'package:monitoring_system/model/field_model.dart';

Future getFieldData() async {
  http
      .get(Uri.parse(
          "https://api.thingspeak.com/channels/1239189/fields/1.json?api_key=OTTR5W227YC0KE2V&results=2"))
      .then((value) {
    log(value.body);
  }).catchError((e) {
    log("Http error $e");
  });
}

Future<dynamic> fetchDataPeriodically() async {
  // Replace with your actual API URL
  final url = Uri.parse(
      'https://api.thingspeak.com/channels/1239189/fields/1.json?api_key=OTTR5W227YC0KE2V&results=2');

  while (true) {
    final response = await http.get(url);
    // Process the response data
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Do something with the data

      if ((data is Map) &&
          (data.containsKey("channel") &&
              (data['feeds'] is List) &&
              (data['channel'] is Map))) {
        // log("${data['channel']}");

        final fieldData = (data['feeds'] as List).firstWhere((element) {
          return element['entry_id'] == data['channel']['last_entry_id'];
        });

        if (fieldData != null) {
          // log("$fieldData");
          fieldDataProvider.setFieldData(Field.fromJson(fieldData));
        }
      }
      // if (kDebugMode) {
      //   print(data);
      // }
    } else {
      // Handle error
      print('Failed to fetch data: ${response.statusCode}');
    }

    // Wait for 5 seconds before the next request
    await Future.delayed(const Duration(seconds: 5));
  }
}

// asinInterval() async {
//   final isolate = await Isolate.spawn(await getFieldData(), null);

//   // Setting up a periodic timer to send a message to the isolate
//   Timer.periodic(
//       Duration(seconds: 5), (_) => isolate.controlPort.send("request"));

//   // Receiving messages from the isolate (optional)
//   // isolate.controlPort.send(message)
// }
