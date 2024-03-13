import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          'Media Query',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      /*body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: _mediaQuery.size.height * 0.5,
            width: _mediaQuery.size.width * 0.3,
            color: Colors.blue,
          ),
          Container(
            //height: _mediaQuery.size.height * 0.5,
            width: _mediaQuery.size.width * 0.7,
            color: Colors.red,
          ),
        ],
      ),*/
      /*body: Builder(
        builder: (context) {
          if (_mediaQuery.orientation == Orientation.portrait) {
            return portraitWidget(_mediaQuery.size);
          } else {
            return landscapeWidget(_mediaQuery.size);
          }
        },
      ),*/
      body: OrientationBuilder(
        builder: (context, orientation) {
          if (orientation == Orientation.portrait) {
            return portraitWidget(_mediaQuery.size);
          } else {
            return landscapeWidget(_mediaQuery.size);
          }
        },
      ),
    );
  }

  Widget portraitWidget(Size size) {
    return Container(
      color: Colors.green,
      height: size.height * 0.7,
      width: size.width * 0.7,
      child: const Center(
        child: Text(
          'Portrait',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget landscapeWidget(Size size) {
    return Container(
      color: Colors.blue,
      height: size.height * 0.3,
      width: size.width * 0.5,
      child: const Center(
        child: Text(
          'Landscape',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
