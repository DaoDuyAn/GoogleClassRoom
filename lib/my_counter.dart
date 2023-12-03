import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {

  int counter = 0;

  void initState(){
    super.initState();
    loadData();
  }

  void loadData() async{
    final prefs = await SharedPreferences.getInstance();
    // await prefs.setInt ('counter', counter);
    setState(() {
      counter = prefs.getInt("count") ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              "Counter: $counter",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  // Viết code tăng dữ liệu lên ở đây
                  final prefs = await SharedPreferences.getInstance();

                  setState((){
                    counter = (prefs.getInt('count') ?? 0) + 1;
                    prefs.setInt("count", counter);
                  });
                  print(counter);
                },
                child: Text("Increment Counter")
            ),
          ],
        ),
      ),
    );
  }
}
