// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:developer';

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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await fetchDataPeriodically();
      // Timer.periodic(Duration(seconds: 5), (timer) async {
      //   await getFieldData();
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FieldDataProvider fieldData = Provider.of<FieldDataProvider>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          ListTile(
            leading: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: getColor(fieldData.field1?.value)),
            ),
            title: Text("Machine name 1 (test)"),
            trailing: fieldData.field1?.value != 1
                ? Text(timeago.format(DateTime.now().subtract(DateTime.now()
                    .difference(
                        fieldData.field1?.createdAt ?? DateTime.now()))))
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
