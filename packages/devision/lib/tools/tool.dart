// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:devision/tools/network.dart';

class Tool {
  Tool({
    required this.name,
    required this.icon,
    required this.page,
  });

  final String name;
  final Widget icon;
  final Widget page;

  static final items = <Tool>[
    Tool(
      name: 'Network',
      icon: const Icon(Icons.network_wifi_rounded),
      page: const NetworkTool(),
    ),
  ];
}

abstract class DevisionData<T> {
  DevisionData({
    required this.date,
    required this.data,
  });

  final DateTime date;
  final T data;

  toLogString();
}
