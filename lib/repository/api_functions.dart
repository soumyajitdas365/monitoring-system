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

final List<Map<int, String>> urlList = [
  {
    1: 'https://api.thingspeak.com/channels/2478092/fields/1.json?api_key=N1SI82TALZEEDBE6&results=1'
  },
  {
    2: 'https://api.thingspeak.com/channels/2478104/fields/1.json?api_key=U8GO46PDRTLS3E60&results=1'
  },
  {
    3: 'https://api.thingspeak.com/channels/2478106/fields/1.json?api_key=G7OXN14L6E2I3G9Y&results=1'
  },
  {
    4: 'https://api.thingspeak.com/channels/2478144/fields/1.json?api_key=BE6RR0ERQMX7WGM2&results=1'
  },
];

Future<void> callMultipleApisSequentially() async {
  for (final url in urlList) {
    final response = await http.get(Uri.parse(url.values.first));
    final data = json.decode(response.body);

    if ((data is Map) &&
        (data.containsKey("channel") &&
            (data['feeds'] is List) &&
            (data['feeds'] as List).isNotEmpty &&
            (data['channel'] is Map))) {
      // log("${data['channel']}");

      final fieldData = data['feeds'][0];

      if (fieldData != null) {
        fieldData['name'] = data['channel']['name'];
        switch (url.keys.first) {
          case 1:
            fieldDataProvider.setField1Data(Field.fromJson(fieldData));
          case 2:
            fieldDataProvider.setField2Data(Field.fromJson(fieldData));
          case 3:
            fieldDataProvider.setField3Data(Field.fromJson(fieldData));
          case 4:
            fieldDataProvider.setField4Data(Field.fromJson(fieldData));
        }
      }
    } else {
      log("error found");
    }

    // Process the data from each API call
  }
}

Future<dynamic> fetchDataPeriodically() async {
  // Replace with your actual API URL
  final url1 = Uri.parse(
      'https://api.thingspeak.com/channels/2478092/fields/1.json?api_key=N1SI82TALZEEDBE6&results=1');
  final url2 = Uri.parse(
      'https://api.thingspeak.com/channels/2478104/fields/1.json?api_key=U8GO46PDRTLS3E60&results=1');
  final url3 = Uri.parse(
      'https://api.thingspeak.com/channels/2478106/fields/1.json?api_key=G7OXN14L6E2I3G9Y&results=1');
  final url4 = Uri.parse(
      'https://api.thingspeak.com/channels/2478144/fields/1.json?api_key=BE6RR0ERQMX7WGM2&results=1');

  // while (!(fieldDataProvider.failed)) {
  final response1 = await http.get(url1);
  //! Process the response data 1
  if (response1.statusCode == 200) {
    final data = json.decode(response1.body);
    // Do something with the data

    if ((data is Map) &&
        (data.containsKey("channel") &&
            (data['feeds'] is List) &&
            (data['feeds'] as List).isNotEmpty &&
            (data['channel'] is Map))) {
      // log("${data['channel']}");

      final fieldData = data['feeds'][0];

      if (fieldData != null) {
        fieldData['name'] = data['channel']['name'];
        fieldDataProvider.setField1Data(Field.fromJson(fieldData));
      }
    }
    // if (kDebugMode) {
    //   print(data);
    // }
  } else {
    // fieldDataProvider.setfailed(true);
    // Handle error
    log('Failed to fetch data 1: ${response1.statusCode}');
  }

  final response2 = await http.get(url2);
  //! Process the response data 2
  if (response2.statusCode == 200) {
    final data = json.decode(response2.body);
    // Do something with the data

    if ((data is Map) &&
        (data.containsKey("channel") &&
            (data['feeds'] is List) &&
            (data['feeds'] as List).isNotEmpty &&
            (data['channel'] is Map))) {
      // log("${data['channel']}");

      final fieldData = data['feeds'][0];

      //  (data['feeds'][0] as List).firstWhere((element) {
      //   return element['entry_id'] == data['channel']['last_entry_id'];
      // });

      if (fieldData != null) {
        fieldData['name'] = data['channel']['name'];
        fieldDataProvider.setField2Data(Field.fromJson(fieldData));
      }
    }
    // if (kDebugMode) {
    //   print(data);
    // }
  } else {
    // fieldDataProvider.setfailed(true);
    // Handle error
    log('Failed to fetch data 2: ${response1.statusCode}');
  }
  final response3 = await http.get(url3);
  //! Process the response data 3
  if (response3.statusCode == 200) {
    final data = json.decode(response3.body);
    // Do something with the data

    if ((data is Map) &&
        (data.containsKey("channel") &&
            (data['feeds'] is List) &&
            (data['feeds'] as List).isNotEmpty &&
            (data['channel'] is Map))) {
      // log("${data['channel']}");

      final fieldData = data['feeds'][0];

      if (fieldData != null) {
        fieldData['name'] = data['channel']['name'];
        fieldDataProvider.setField3Data(Field.fromJson(fieldData));
      }
    }
    // if (kDebugMode) {
    //   print(data);
    // }
  } else {
    // fieldDataProvider.setfailed(true);
    // Handle error
    log('Failed to fetch data 3: ${response1.statusCode}');
  }
  final response4 = await http.get(url4);
  //! Process the response data 4
  if (response4.statusCode == 200) {
    final data = json.decode(response4.body);
    // Do something with the data

    if ((data is Map) &&
        (data.containsKey("channel") &&
            (data['feeds'] is List) &&
            (data['feeds'] as List).isNotEmpty &&
            (data['channel'] is Map))) {
      // log("${data['channel']}");

      final fieldData = data['feeds'][0];

      if (fieldData != null) {
        fieldData['name'] = data['channel']['name'];
        fieldDataProvider.setField4Data(Field.fromJson(fieldData));
      }
    }
    // if (kDebugMode) {
    //   print(data);
    // }
  } else {
    // fieldDataProvider.setfailed(true);
    // Handle error
    log('Failed to fetch data 4: ${response1.statusCode}');
    // }

    //! Wait for 5 seconds before the next request
    // await Future.delayed(const Duration(seconds: 5));
  }
}
