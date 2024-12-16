import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import '../pigeon.dart';

Future<Res> sendToNative({key, data}) async {
  Req request = Req()
    ..key = key
    ..data = data;
  ReqApi api = ReqApi();
  Res reply = await api.request(request);
  log('reply-key: ${reply.key}');
  log('reply-data: ${reply.data}');
  return reply;
}
//Ex: sendToNative(key: keyOpenWebView, data: {"link": item.src, "id": "123"});

class Native extends StatefulWidget {
  const Native({
    Key? key,
    required this.child,
    required this.doNativeDataBack,
  }) : super(key: key);

  final Widget child;
  final Function(dynamic data) doNativeDataBack;

  @override
  State<Native> createState() => _NativeState();
}

class _NativeState extends State<Native> {

  EventChannel? _stream;

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    _stream = const EventChannel('bridgeStream');
    _stream?.receiveBroadcastStream().listen((onData) {
      log('ReceiveBroadCastStream data from native: $onData');
      if (onData == null) {
        log("Error: bridgeStream: You didn't get data");
        return;
      }
      widget.doNativeDataBack(onData);
    });
  }


  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
