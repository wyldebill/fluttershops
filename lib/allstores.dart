import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mapstesting/storeInfo.dart';
import 'package:mapstesting/StoreDetail.dart';
import 'package:flutter/services.dart'
    show rootBundle; // TODO: what is rootbundle??
import 'dart:convert';

class AllStores2 extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<AllStores2>
    with AutomaticKeepAliveClientMixin //  this will preserve state in each tab.
// WidgetsBindingObserver, detects foreground/backgrounding of app.
// https://medium.com/flutter-community/flutter-lifecycle-for-android-and-ios-developers-8f532307e0c7

{
  List<StoreInfo> listOfStores;

  @override
  bool get wantKeepAlive => true; // TODO: what does this do?

  @override
  void initState() {
    super.initState();

    loadStore().then((value) {
      listOfStores = value.stores;
      setState(() {
        listOfStores.forEach((StoreInfo store) {});
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: listOfStores.length,  // this listview has a static number of items in it
        itemBuilder: (BuildContext context, int index) {
          StoreInfo storeToShow = listOfStores[index];
          
          // build the tile in the listview
          return ListTile(    
              title: Text('${listOfStores[index].name}'),
              trailing: Icon(Icons.keyboard_arrow_right),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => StoreDetail(StoreInfo()),
                      builder: (context) => StoreDetail(storeToShow)
                    ));
              });
        });

    //return _myListView(context);
    /*return ListView( 
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
    );*/
  }

  // read the list of stores json in the assets folder
  Future<String> _loadAStoresAsset() async {
    return await rootBundle.loadString('assets/storeInfoDataJSON.json');
  }

  // debugging:  load the list of json format stores and deserialze to a list of storeinfo
  Future<StoresList> loadStore() async {
    String jsonString = await _loadAStoresAsset();
    final jsonResponse = json.decode(jsonString);
    StoresList listOfStores = StoresList.fromJson(jsonResponse);
    return listOfStores;
    //StoreInfo store = new StoreInfo.fromJson(jsonResponse);

    //DateTime parsedDt = (listOfStores.stores[1].mondayOpenTime);
    //DateTime rightNow = DateTime.now();
    //print(rightNow.weekday);

    // print(parsedDt.year); // 4
    // print(parsedDt.weekday); // 4
    // print(parsedDt.month); // 4
    // print(parsedDt.day); // 2
    // print(parsedDt.hour); // 15
    // print(parsedDt.minute); // 21
    // print(parsedDt.second); // 49

    //print(listOfStores.stores[1].name);
  }
}

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
