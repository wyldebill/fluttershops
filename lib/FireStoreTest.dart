import 'package:buffaloretailgroupmap/storeInfo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireStoreTest extends StatefulWidget {
  @override
  _FireStoreTestState createState() => _FireStoreTestState();
}

class _FireStoreTestState extends State<FireStoreTest> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Firestore.instance.collection('stores').snapshots(),
      builder: (context, snapshot) {

     // no data yet, display a progress indicator
     if (!snapshot.hasData) {
       print('no data yet...');
      return CircularProgressIndicator();
     }

    // also should watch for error in the stream
    if (snapshot.hasError)
    {

    }

    // we have data in the snapshot, let's rebuild the ui!
    // use snapshot.data.documents to get a list of all the current/updated documents. not just the ones that changed.
     return _buildList(context, snapshot.data.documents);
   },
      
    );
  }

   Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshots) {
   return ListView(
     padding: const EdgeInsets.only(top: 20.0),
     children: snapshots.map((data) => _buildListItem(context, data)).toList(),
   );
 }

Widget _buildListItem(BuildContext context, DocumentSnapshot data) {
 final record = StoreInfo.fromSnapshot(data);
  

   return //Padding(
     //key: ValueKey(record.name),
     //padding: const EdgeInsets.all(8.0),
     //child: Container(
      //  decoration: BoxDecoration(
      //    border: Border.all(color: Colors.grey),
      //    borderRadius: BorderRadius.circular(5.0),
      //  ),
       //child: 
       ListTile(
         title: Text(record.name),
         subtitle: Text(record.tagline),
          trailing: Icon(Icons.keyboard_arrow_right),
         //onTap: () => record.reference.updateData({'votes': FieldValue.increment(1)}),
         //onTap: () => record.reference.updateData({'votes': record.votes + 1}),
       );
     //),
  // );
 }
}
