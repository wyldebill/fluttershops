import 'package:flutter/material.dart';
import 'package:mapstesting/secondroute.dart';

class AllStores extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BodyLayout();
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}

// replace this function with the code in the examples
Widget _myListView(BuildContext context) {
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          title: Text('Sun'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Moon'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Star'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Apple'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Peas'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Carrots'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Cat'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Dog'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Keys'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Pool'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Juice'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Goose'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Cart'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
        ListTile(
          title: Text('Sauce'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondRoute(),
                ));
          },
        ),
      ],
    ).toList(),
  );
}
