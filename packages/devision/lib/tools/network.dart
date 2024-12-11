import 'package:devision/tools/tool.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ComposedResponse {
  ComposedResponse({required this.request, required this.response});

  final RequestOptions request;
  final Response? response;
}

class NetworkData extends DevisionData<ComposedResponse> {}

class NetworkTool extends StatefulWidget {
  const NetworkTool({super.key});

  @override
  State<NetworkTool> createState() => _NetworkToolState();
}

class _NetworkToolState extends State<NetworkTool> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Network'),
      ),
    );
  }
}
