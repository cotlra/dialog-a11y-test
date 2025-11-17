import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  void _openDialog() {
    showDialog(context: context, builder: (context){
      return Dialog(child: Container(width: 400,height: 300,child: Center(child: Text('ダイアログだよ', style: Theme.of(context).textTheme.bodyLarge,),),),);
    });
  }

  void _moveToListPage(){
    Navigator.of( context).push(MaterialPageRoute(builder: (context){
      return const ListPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ダイアログの表示テスト'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FilledButton(
              onPressed: _openDialog,
              child: Text('ダイアログを開く'),
            ),
            SizedBox(height: 20,),
            FilledButton(
              onPressed: _moveToListPage,
              child: Text('リストページに移動を開く'),
            ),
          ],
        ),
      ),
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('リストの表示テスト'),
      ),

      body: Column(
        verticalDirection: VerticalDirection.up,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('テキスト1'),
          Text('テキスト2'),
          Text('テキスト3'),
          Text('テキスト4'),
          Text('テキスト5'),
          Text('テキスト6'),
          Text('テキスト7'),
          Text('テキスト8'),
          Text('テキスト9'),
          Text('テキスト10'),
        ],
      ),
    );
  }
}
