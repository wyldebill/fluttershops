import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapstesting/storeInfo.dart';

class StoreDetail extends StatelessWidget {
  StoreInfo _storeDetail;
  StoreDetail(StoreInfo store) {
    _storeDetail = store;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.blue, // TODO: use themeing instead
          appBar: AppBar(
            title: Text(_storeDetail.name),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // all the child widgets will be in a column
                  Image.asset(
                      // hero image of storefront

                      'assets/images/welcome.jpg',  
                        
                      
                    ),
                  SizedBox(height: 10),
                  Row(
                    // i wanted 2 columns, storename and distance
                    children: [
                      Text(_storeDetail.name,

                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text('                           175 Ft',
                          textAlign: TextAlign.right,
                          style: TextStyle(
                            fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  Text(
                    //store tag name
                    _storeDetail.tagline,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ), // poor mans separator

                  Text(
                    //store website
                    _storeDetail.website,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                   Text(
                    //store facebook link
                    'Facebook link ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                  Divider(),

Text(
                    'Hours: ',
                    
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Table(
                    // border: TableBorder.all(),
                    children: [
                      TableRow(children: [
                        Text('Monday',
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayOpenTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayCloseTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal))
                      ]),
                        TableRow(children: [
                        Text('Monday',
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayOpenTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayCloseTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal))
                      ]),
                        TableRow(children: [
                        Text('Monday',
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayOpenTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayCloseTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal))
                      ]),
                        TableRow(children: [
                        Text('Monday',
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayOpenTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal)),
                        Text(_storeDetail.mondayCloseTimeOnly.format(context),
                            textAlign: TextAlign.left,
                            style: TextStyle( color: Colors.white,
                        fontSize: 15,fontWeight: FontWeight.normal))
                      ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                      //   Text('Tuesday', textAlign: TextAlign.center),
                      //   Text('open', textAlign: TextAlign.center),
                      //   Text('close',
                      //       textAlign: TextAlign.center,
                      //       style: TextStyle(fontWeight: FontWeight.bold))
                      // ]),
                      // TableRow(children: [
                        // Text('Tuesday', textAlign: TextAlign.center),
                        // Text('open', textAlign: TextAlign.center),
                        // Text('close',
                        //     textAlign: TextAlign.center,
                        //     style: TextStyle(fontWeight: FontWeight.bold))
                      //]),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(_storeDetail.name),
  //     ),
  //     body: Center(
  //       child: SafeArea
  //       (

  //           child: Container(
  //           width: 400,
  //           height: 600,

  //           child: Card(
  //             //shape: RoundedRectangleBorder(
  //             //borderRadius: BorderRadius.circular(15.0),
  //             //),
  //             //color: Colors.grey,
  //             elevation: 10,
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               children: <Widget>[
  //                 //const ListTile(
  //                 //leading: Icon(Icons.store, size: 70),
  //                 // title: Text(_storeDetail.name),
  //                 Text(_storeDetail.name),
  //                 Text('Distance: ' + _storeDetail.distance),
  //                 Text('latitude:' + _storeDetail.latitude),
  //                 Text('longitude:' + _storeDetail.longitude),

  //                 Text('Monday open:' +
  //                     _storeDetail.mondayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.mondayOpenTime.minute.toString()),
  //                 Text('Monday close: ' +
  //                     _storeDetail.mondayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.mondayCloseTime.minute.toString()),

  //                 Text('Tuesday open:' +
  //                     _storeDetail.tuesdayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.tuesdayOpenTime.minute.toString()),
  //                 Text('Tuesday close: ' +
  //                     _storeDetail.tuesdayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.tuesdayCloseTime.minute.toString()),

  //                 Text('Wednesday open:' +
  //                     _storeDetail.wednesdayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.wednesdayOpenTime.minute.toString()),
  //                 Text('Wednesday close: ' +
  //                     _storeDetail.wednesdayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.wednesdayCloseTime.minute.toString()),

  //                 Text('Thursday open:' +
  //                     _storeDetail.thursdayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.thursdayOpenTime.minute.toString()),
  //                 Text('Thursday close: ' +
  //                     _storeDetail.thursdayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.thursdayCloseTime.minute.toString()),

  //                 Text('Friday open:' +
  //                     _storeDetail.fridayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.fridayOpenTime.minute.toString()),
  //                 Text('Friday close: ' +
  //                     _storeDetail.fridayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.fridayCloseTime.minute.toString()),

  //                 Text('Satruday open:' +
  //                     _storeDetail.saturdayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.saturdayOpenTime.minute.toString()),
  //                 Text('SAturday close: ' +
  //                     _storeDetail.saturdayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.saturdayCloseTime.minute.toString()),

  //                 Text('Sunday open:' +
  //                     _storeDetail.sundayOpenTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.sundayOpenTime.minute.toString()),
  //                 Text('Sunday close: ' +
  //                     _storeDetail.sundayCloseTime.hour.toString() +
  //                     ':' +
  //                     _storeDetail.sundayCloseTime.minute.toString()),

  //                 //subtitle: Text('store tagline',
  //                 //   style: TextStyle(color: Colors.white)),
  //                 //),
  //                 // ButtonTheme.bar(
  //                 //   child: ButtonBar(
  //                 //     children: <Widget>[
  //                 //       FlatButton(
  //                 //         child: const Text('Edit',
  //                 //             style: TextStyle(color: Colors.white)),
  //                 //         onPressed: () {},
  //                 //       ),
  //                 //       FlatButton(
  //                 //         child: const Text('Delete',
  //                 //             style: TextStyle(color: Colors.white)),
  //                 //         onPressed: () {},
  //                 //       ),
  //                 //     ],
  //                 //   ),
  //                 // ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
