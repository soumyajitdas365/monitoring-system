// Timer.periodic(new Duration(seconds: 1), (timer) {
//    debugPrint(timer.tick.toString());
// });
import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

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

Future<void> fetchDataPeriodically() async {
  // Replace with your actual API URL
  final url = Uri.parse('https://api.example.com/data');

  while (true) {
    final response = await http.get(url);
    // Process the response data
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      // Do something with the data
      print(data);
    } else {
      // Handle error
      print('Failed to fetch data: ${response.statusCode}');
    }

    // Wait for 5 seconds before the next request
    await Future.delayed(const Duration(seconds: 5));
  }
}
