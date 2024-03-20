// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:monitoring_system/logic/field_data_provider.dart';
import 'package:monitoring_system/repository/api_functions.dart';
import 'package:monitoring_system/utils.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

class MonitoringScreen extends StatefulWidget {
  const MonitoringScreen({super.key});

  @override
  State<MonitoringScreen> createState() => _MonitoringScreenState();
}

class _MonitoringScreenState extends State<MonitoringScreen> {
  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {

    //   // Timer.periodic(Duration(seconds: 5), (timer) async {
    //   //   await getFieldData();
    //   // });
    // });
    super.initState();
  }

  void runCron(bool isActive) async {
    while (isActive) {
      await fetchDataPeriodically();
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  @override
  Widget build(BuildContext context) {
    FieldDataProvider fieldData = Provider.of<FieldDataProvider>(context);
    runCron(true);
    // log("${fieldData.field1?.createdAt}");÷\
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring System'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: getColor(fieldData.field1?.value),
                    center: Alignment(0, 0),
                    stops: [0, 1]),
                // color: getColor(fieldData.field1?.value),
              ),
            ),
            title: Text(
              fieldData.field1?.name ?? "No name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: fieldData.field1?.value != 1
                ? Text(
                    timeago.format(
                      DateTime.now().subtract(
                        DateTime.now().difference(
                          fieldData.field1?.createdAt ?? DateTime.now(),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  )
                : null,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: getColor(fieldData.field2?.value),
                    center: Alignment(0, 0),
                    stops: [0, 1]),
                // color: getColor(fieldData.field1?.value),
              ),
            ),
            title: Text(
              fieldData.field2?.name ?? "No name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: fieldData.field2?.value != 1
                ? Text(
                    timeago.format(
                      DateTime.now().subtract(
                        DateTime.now().difference(
                          fieldData.field2?.createdAt ?? DateTime.now(),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  )
                : null,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: getColor(fieldData.field3?.value),
                    center: Alignment(0, 0),
                    stops: [0, 1]),
                // color: getColor(fieldData.field1?.value),
              ),
            ),
            title: Text(
              fieldData.field3?.name ?? "No name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: fieldData.field3?.value != 1
                ? Text(
                    timeago.format(
                      DateTime.now().subtract(
                        DateTime.now().difference(
                          fieldData.field3?.createdAt ?? DateTime.now(),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  )
                : null,
          ),
          ListTile(
            leading: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                    colors: getColor(fieldData.field4?.value),
                    center: Alignment(0, 0),
                    stops: [0, 1]),
                // color: getColor(fieldData.field1?.value),
              ),
            ),
            title: Text(
              fieldData.field4?.name ?? "No name",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            trailing: fieldData.field4?.value != 1
                ? Text(
                    timeago.format(
                      DateTime.now().subtract(
                        DateTime.now().difference(
                          fieldData.field4?.createdAt ?? DateTime.now(),
                        ),
                      ),
                    ),
                    style: TextStyle(fontSize: 14),
                  )
                : null,
          ),

          // Center(
          //   child: Text('Hello World! ${fieldData.field1?.entryId}'),
          // ),
        ],
      ),
    );
  }
}
