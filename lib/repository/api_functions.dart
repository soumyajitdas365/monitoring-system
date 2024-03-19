// Timer.periodic(new Duration(seconds: 1), (timer) {
//    debugPrint(timer.tick.toString());
// });
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
