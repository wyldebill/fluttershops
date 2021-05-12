import 'package:firebase_image/firebase_image.dart';
import 'package:flutter/material.dart';
import 'package:buffaloretailgroupmap/models/storeInfo.dart';

import '../ImageWidgetPlaceholder.dart';

class StoreDetail extends StatelessWidget {
  StoreInfo _storeDetail;
  StoreDetail(StoreInfo store) {
    _storeDetail = store;
  }

  @override
  Widget build(BuildContext context) {
    //print(_storeDetail.description);
    return Scaffold(
        // backgroundColor: Colors.pink, // TODO: use themeing instead
        appBar: AppBar(
          title: Text(_storeDetail.name),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      //height: 250,
                      color: Colors.white,
                      //padding: EdgeInsets.all(16),
                      child: ImageWidgetPlaceholder(
                        placeholder: Center(
                          child: CircularProgressIndicator(
                              // value: loadingProgress.expectedTotalBytes != null
                              //    ? loadingProgress.cumulativeBytesLoaded /
                              //        loadingProgress.expectedTotalBytes
                              //    : null,
                              ),
                        ),
                        image: FirebaseImage(_storeDetail.imageName,
                            shouldCache:
                                true, // The image should be cached (default: True)
                            maxSizeBytes: 3000 *
                                1000, // 3MB max file size (default: 2.5MB)
                            cacheRefreshStrategy: CacheRefreshStrategy
                                .BY_METADATA_DATE // Switch off update checking
                            ),
                      ),

                      //Image.network(
                      //   // logo image here
                      //   _storeDetail.description,
                      //   // 'https://firebasestorage.googleapis.com/v0/b/brgfirebase.appspot.com/o/images%2Flucky.jpg?alt=media&token=9817b5bd-38b7-4492-9993-31ca6c956d2d',
                      //   frameBuilder: (BuildContext context, Widget child,
                      //           int frame, bool wasSynchronouslyLoaded) =>
                      //       wasSynchronouslyLoaded
                      //           ? child
                      //           : AnimatedOpacity(
                      //               child: child,
                      //               opacity: frame == null ? 0 : 1,
                      //               duration: const Duration(seconds: 2),
                      //               curve: Curves.easeOut,
                      //             ),
                      //   loadingBuilder: (context, child, progress) =>
                      //       progress == null
                      //           ? child
                      //           : LinearProgressIndicator(
                      //               valueColor: AlwaysStoppedAnimation<Color>(
                      //                   Colors.red),
                      //             ),
                      //   errorBuilder: (BuildContext context, Object exception,
                      //           StackTrace stackTrace) =>
                      //       Text('Failed to load image'),
                      // ),
                    ),

                    // Image.network( _storeDetail.description,    //TODO:  using the description field, fix this
                    //  height: 200,
                    //    width: double.infinity,
                    //    fit: BoxFit.fitWidth,
                    //  ),
                    // Image.asset(
                    //   // hero image of storefront

                    //  //_storeDetail.imageName,
                    //  'assets/images/welcome.jpg',
                    //  height: 200,
                    //   width: double.infinity,
                    //   fit: BoxFit.fitWidth,
                    // ),
                    Divider(color: Colors.white),
                    Row(
                      // i wanted 2 columns, storename and distance
                      children: [
                        Expanded(
                          child: Text(_storeDetail.name,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                  //color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        // Text('         175 Ft',   // TODO: fix alignment hack here
                        //     textAlign: TextAlign.right,
                        //     style: TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Text(
                      //store tag name
                      "",
                      style: TextStyle(
                          //color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                    // Divider(color: Colors.white),
                    //   Text(
                    //     //store website
                    //     _storeDetail.website,
                    //     style: TextStyle(
                    //         //color: Colors.white,
                    //         fontSize: 15,
                    //         fontWeight: FontWeight.normal),
                    //   ),
                    // Text(
                    //   //store facebook link
                    //   'Facebook link ?',
                    //   style: TextStyle(
                    //       //color: Colors.white,
                    //       fontSize: 15,
                    //       fontWeight: FontWeight.normal),
                    // ),
                    Divider(color: Colors.white),

                    // todo: need a occasional marker/indicator too?

                    Text(
                      'Hours: ',
                      style: TextStyle(
                          //color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    if (_storeDetail.occasional == true)
                      Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("*Occasional Shop - Open the 1st Thursday-Sunday of each month and special events.",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal)),
                    ),
                    Table(

                        // border: TableBorder.all(),
                        children: [
                          // each row of store hours has 3 child widgets
                          // <day of week> <Open time/Closed>  <Close time/Closed>

                          TableRow(children: [
                            Text('Monday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(

                                //  taking a shortcut here
                                // if the hour is 0, i know the time is illegal - store is closed.
                                // i don't check the minutes if the hour is 0.
                                _storeDetail.mondayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.mondayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.mondayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.mondayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Tuesday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.tuesdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.tuesdayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.tuesdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.tuesdayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Wednesday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.wednesdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.wednesdayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    // color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.wednesdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.wednesdayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Thursday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.thursdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.thursdayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.thursdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.thursdayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Friday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.fridayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.fridayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.thursdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.fridayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Saturday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.saturdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.saturdayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.saturdayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.saturdayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                          TableRow(children: [
                            Text('Sunday',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.sundayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.sundayOpenTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal)),
                            Text(
                                _storeDetail.sundayOpenTimeOnly.hour == 0
                                    ? "Closed"
                                    : _storeDetail.sundayCloseTimeOnly
                                        .format(context),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    //color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal))
                          ]),
                        ]),
                    Divider(color: Colors.white),

                    ImageWidgetPlaceholder(
                      placeholder: Center(
                        child: CircularProgressIndicator(
                            // value: loadingProgress.expectedTotalBytes != null
                            //    ? loadingProgress.cumulativeBytesLoaded /
                            //        loadingProgress.expectedTotalBytes
                            //    : null,
                            ),
                      ),
                      image: FirebaseImage(_storeDetail.image1,
                          shouldCache:
                              true, // The image should be cached (default: True)
                          maxSizeBytes:
                              3000 * 1000, // 3MB max file size (default: 2.5MB)
                          cacheRefreshStrategy: CacheRefreshStrategy
                              .BY_METADATA_DATE // Switch off update checking
                          ),
                      //width: double.infinity,
                      //fit: BoxFit.fitWidth,
                    ),

                    // Image.asset(
                    //   // store front image 2

                    //   _storeDetail.imageName,
                    //   width: double.infinity,
                    //   fit: BoxFit.fitWidth,
                    // ),
                  ],
                )
              ],
            ),
          ),
        ));
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
