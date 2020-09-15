// blank mostly widget to test navigation and the back button
import 'package:flutter/material.dart';
import 'package:mapstesting/storeInfo.dart';

class StoreDetail extends StatelessWidget {
  StoreInfo _storeDetail;
  StoreDetail(StoreInfo store) {
    _storeDetail = store;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_storeDetail.name),
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
                  title: Text('store name here'),
                  subtitle: Text('store tagline',
                      style: TextStyle(color: Colors.white)),
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