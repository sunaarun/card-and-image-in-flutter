import 'dart:ffi';

import 'package:card_image/MyModel.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  List<MyModel> list = [
    MyModel("1", "https://images.pexels.com/photos/736230/pexels-photo-736230.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", Colors.amberAccent),
    MyModel("2", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRKBvepfawcgXLRjSQVvyhWdzQY919Ftz3chA&usqp=CAU", Colors.pinkAccent),
    MyModel("3", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTiZ8oUJuTWLcHm1wZUovVOwu5Uv3UNes7zaA&usqp=CAU", Colors.purpleAccent),
    MyModel("4", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRF7guhlQXHvi2yg_Fn7d4xg6h9E0z7beE1Nfq8w_h3JAsj_fky-DZEG90n1wmIg1UXMjI&usqp=CAU", Colors.lightBlueAccent),
    MyModel("5", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDWvj4CO1z7Kdm42Ssfsu7GWmr91IjzKP66T_TKG-AhwIswbHfRKsr4pI8kdeSdioJTjM&usqp=CAU", Colors.greenAccent),
    MyModel("6", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRMtp-LhkzZqSePKnTw0yAJ0klmkQG0V0wZKQ&usqp=CAU", Colors.yellowAccent),
    MyModel("7", "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Magnolia_sieboldii_flower_1.jpg/1200px-Magnolia_sieboldii_flower_1.jpg", Colors.redAccent)
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card and Image Example"),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                showDialog(context: context, builder: (_){
                  return AlertDialog(
                    title: Text("Dailog"),
                    content: Image.network("${list[index].url}"),
                  );
                });
              },
              child: Card(
                  shadowColor: list[index].color,
                  elevation: 17,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Icon(Icons.star, color: list[index].color,size: 45,),
                                Text("${list[index].id}")
                              ],
                            ),
                          ),
                          Container(
                            height: 200,
                            width: 200,
                            child: Image.network("${list[index].url}", fit: BoxFit.cover,),
                          )
                        ],
                      ),
                      Text("Some information about flower")
                    ],
                  )

              ),
            );
          }
    )
    );
    }
}

