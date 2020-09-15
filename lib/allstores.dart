import 'package:flutter/material.dart';

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
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => StoreDetail(StoreInfo()),
            //     ));
          },
        ),
        ListTile(
          title: Text('Moon'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => StoreDetail(),
            //     ));
          },
        ),
        ListTile(
          title: Text('Star'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SecondRoute(),
            //     ));
          },
        ),
        ListTile(
          title: Text('Apple'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => SecondRoute(),
            //     ));
          },
        ),
        ListTile(
          title: Text('Sauce'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //       builder: (context) => StoreDetail(),
            //     ));
          },
        ),
      ],
    ).toList(),
  );
}
