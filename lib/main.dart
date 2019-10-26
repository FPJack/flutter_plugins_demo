import 'package:flutter/material.dart';
import 'package:flutter_plugins_demo/config/plugins-list.dart';
import 'package:flutter_plugins_demo/router/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: 'Flutter Demo',
			theme: ThemeData(
				primarySwatch: Colors.blue,
			),
			home: MyHomePage(title: 'Flutter Plugins Demo'),
			routes: routes,
		);
	}
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
	// List<Map> plugins=plugins;

	@override
	void initState() {
		super.initState();
		print(plugins);
	}

	@override
	Widget build(BuildContext context) {
		return Scaffold(
			appBar: AppBar(
				title: Text(widget.title),
			),
			body: ListView.separated(
				itemCount: plugins.length,
				separatorBuilder: (content, index) {
					return new Divider(height: 1,color: Color(0xfff5f5f5),);
				},
				itemBuilder: (context,index){
					print(plugins[index]);
					return ListItem(plugins[index]);
				},
			),
			// floatingActionButton: FloatingActionButton(
			// 	onPressed: _incrementCounter,
			// 	tooltip: 'Increment',
			// 	child: Icon(Icons.add),
			// ), 
		);
	}

	Widget ListItem(Map item){
		return GestureDetector(
			onTap: (){
				Navigator.of(context).pushNamed(item['routeName']);
			},
			child: Container(
				height: 70,
				padding: EdgeInsets.all(10),
				color: Colors.white,
				child: Flex(
					direction: Axis.horizontal,
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						Expanded(
							child: Column(
								crossAxisAlignment: CrossAxisAlignment.start,
								children: <Widget>[
									Text(item['title'],maxLines: 2,style: TextStyle(fontSize: 16),),
									Container(
										padding: EdgeInsets.only(top: 2,bottom: 2,left: 4,right: 4),
										decoration: BoxDecoration(
											color: Color(0xfff5f5f5),
											borderRadius: BorderRadius.circular(2)
										),
										child: Text(item['plugin_name'],style: TextStyle(color: Colors.black54)),
									)
								],
							),
						),
						Icon(Icons.arrow_forward_ios,color: Colors.black26,)
					],
				),
			),
		);
	}
}
