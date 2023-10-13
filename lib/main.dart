import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/data.dart';

import 'ReceiveData.dart';

void main() {
  runApp(ChangeNotifierProvider(create: (context) => Data(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  SnakBarMsg() {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Value will be decremented")));
  }

// set state method to change
  /* Increment()
    setState(() {
      count++;
      if (count == 10) {
        count = 0;
        SnakBarMsg();
      }
    });
  }*/

  @override
  Widget build(BuildContext context) {
    final providerData = Provider.of<Data>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "State and provider demo",
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontSize: 32.0,
          ),
          backgroundColor: Colors.deepPurple,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 32),
                  child: Text(providerData.count.toString(),
                      style:
                          const TextStyle(color: Colors.deepPurple, fontSize: 40))),
              ElevatedButton(
                  onPressed: () {
                    providerData.Increment();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Text(
                    "Count",
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const ReceiveData()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple),
                  child: const Text(
                    "Send Data",
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
