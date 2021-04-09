import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/models/storeInfo.dart';
import 'package:buffaloretailgroupmap/pages/storedetailview/StoreDetail.dart';
import 'package:flutter/services.dart'
    show rootBundle; // TODO: what is rootbundle??
import 'dart:convert';

class ListOfAllStores extends StatefulWidget {
  @override
  _StoreListState createState() => _StoreListState();
}

class _StoreListState extends State<ListOfAllStores>
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

    // loadStore().then((value) {
    //   listOfStores = value.stores;
    //   setState(() {
    //     listOfStores.forEach((StoreInfo store) {

    //     });
    //   });
    // });


  }

  @override
  Widget build(BuildContext context)
  {
    super.build(context);
    
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('stores').orderBy('name', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {

        }

      
        return _buildList(context, snapshot.data.docs);
        
      }
    );
  }

  Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshots) {
    return ListView(
       padding: const EdgeInsets.only(top: 20.0),
      children: snapshots.map((data ) => _buildListItem(context, data)).toList(),
    );
  }

  Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
    final record = StoreInfo.fromSnapshot(data);

     return //Padding(
     //key: ValueKey(record.id),
    // padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
    //  child: Container(
    //    decoration: BoxDecoration(
    //      border: Border.all(color: Colors.grey),
    //      borderRadius: BorderRadius.circular(5.0),
    //    ),
       //child: 
       ListTile(
         title: Text(record.name),
         subtitle: Text(record.tagline.toString()),
         trailing: Icon(Icons.keyboard_arrow_right),
         onTap: () {
           Navigator.push(
                    context,
                    MaterialPageRoute(
                      //builder: (context) => StoreDetail(StoreInfo()),
                      builder: (context) => StoreDetail(record)
                    ));
         }
         //onTap: () => record.reference.updateData({'votes': record.votes + 1}),
       //),
     );
   
  }
  // Widget build(BuildContext context) {
  //   return ListView.builder(     // TODO: this needs to be a futurebuilder
  //       //padding: const EdgeInsets.all(10),
  //       itemCount: listOfStores == null ? 0 : listOfStores.length,  // this listview has a static number of items in it
  //       itemBuilder: (BuildContext context, int index) {
  //         StoreInfo storeToShow = listOfStores[index];
          
  //         // build the tile in the listview
  //         return ListTile(    
  //             title: Text('${listOfStores[index].name}'),
  //             trailing: Icon(Icons.keyboard_arrow_right),
  //             onTap: () {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     //builder: (context) => StoreDetail(StoreInfo()),
  //                     builder: (context) => StoreDetail(storeToShow)
  //                   ));
  //             });
  //       });

  
  // }

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
   
  }
}


