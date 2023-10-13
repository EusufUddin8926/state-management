import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data.dart';

class ReceiveData extends StatelessWidget {
  const ReceiveData({super.key});

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return Scaffold(
      body: Center(
          child: Text(
        providerData.count.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 40),
      )),
    );
  }
}
