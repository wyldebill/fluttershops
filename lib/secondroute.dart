// blank mostly widget to test navigation and the back button
import 'package:flutter/material.dart';

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Store Details"),
      ),
      body: Center(
        child: Container(
          width: 400,
          height: 600,
          child: Card(
            //shape: RoundedRectangleBorder(
            //borderRadius: BorderRadius.circular(15.0),
            //),
            //color: Colors.grey,
            elevation: 10,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.store, size: 70),
                  title:
                      Text('Store Name', style: TextStyle(color: Colors.white)),
                  subtitle:
                      Text('-decor-', style: TextStyle(color: Colors.white)),
                ),
                // ButtonTheme.bar(
                //   child: ButtonBar(
                //     children: <Widget>[
                //       FlatButton(
                //         child: const Text('Edit',
                //             style: TextStyle(color: Colors.white)),
                //         onPressed: () {},
                //       ),
                //       FlatButton(
                //         child: const Text('Delete',
                //             style: TextStyle(color: Colors.white)),
                //         onPressed: () {},
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
