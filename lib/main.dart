import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  SemanticsBinding.instance.ensureSemantics();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'アクセシビリティ機能テスト',
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
      return const IconButtonPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アクセシビリティ機能テスト'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.accessibility),
                SizedBox(width: 10,),
                Text('ちょっと長めのテキスト')
              ],
            ),
            SizedBox(height: 20,),
            FilledButton(
              onPressed: _openDialog,
              child: Text('ダイアログを開く'),
            ),
            SizedBox(height: 20,),
            FilledButton(
              onPressed: _moveToListPage,
              child: Text('アイコンボタンページに移動'),
            ),
          ],
        ),
      ),
    );
  }
}

class IconButtonPage extends StatelessWidget {
  const IconButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('アイコンボタンテスト'),
        actions: [
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(24),
        child: Column(
          spacing: 16,
          children: [
            TextField(decoration: InputDecoration(label: Text('名前')),),
            TextField(decoration: InputDecoration(label: Text('電話番号')),),
            TextField(decoration: InputDecoration(label: Text('メールアドレス')),),
          ],
        ),
      ),
    );
  }
}
