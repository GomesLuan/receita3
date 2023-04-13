import 'package:flutter/material.dart';

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: NewAppBar(),
        body: DataBodyWidget(objects: [
          "La Fin Du Monde - Bock - 65 ibu",
          "Sapporo Premiume - Sour Ale - 54 ibu",
          "Duvel - Pilsner - 82 ibu"
        ]),
        bottomNavigationBar: NewNavBar(icons: [
          Icon(Icons.coffee_outlined),
          Icon(Icons.local_drink_outlined),
          Icon(Icons.flag_outlined),
        ]),
      )
    );
  }
}

class NewAppBar extends StatelessWidget implements PreferredSizeWidget {
  NewAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text("Dicas"),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class DataBodyWidget extends StatelessWidget {
  final List<String> objects;

  DataBodyWidget({this.objects = const [] });

  @override
  Widget build(BuildContext context) {
    return Column(children: objects.map( 
      (obj) => Expanded(
        child: Center(child: Text(obj)),
      )
    ).toList());
  }
}

class NewNavBar extends StatelessWidget {
  final List<Icon> icons;
  
  NewNavBar({this.icons = const [] });

  void botaoFoiTocado(int index) {
    print("Tocaram no botão $index");
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: botaoFoiTocado, 
      items: icons.map((e) => BottomNavigationBarItem(
        icon: e,
        label: 'Ícone ${icons.indexOf(e)}',
      )).toList()
    );
  }
}