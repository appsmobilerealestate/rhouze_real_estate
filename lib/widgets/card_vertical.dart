import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_black_white/models/models.dart';
import 'package:flutter_black_white/widgets/widgets.dart';

class CardVertical extends StatelessWidget {

  final Listing listing;

  const CardVertical( this.listing, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const loggedIn = true;
    final String images = listing.images?.first?? '';
    const blurImg = loggedIn == false ? 5.0 : 0.0;
    final screenSize = MediaQuery.of(context).size;
    final listingClass = listing.listingClass?? '';

    final listPrice = listing.listPrice?? '' ;
    double doubleString = double.parse(listPrice);
    String formattedPrice = '\$${doubleString.toStringAsFixed(0).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},')}';
    final String propertyType = listing.details?.propertyType?? '';

    // Address
    final String unitNumber = listing.address?.unitNumber?? '';
    final String unitNumberHyphen = unitNumber == '' ? '' : '$unitNumber - ' ;
    final String streetNumber = listing.address?.streetNumber?? ''; 
    final String streetName = listing.address?.streetName?? '';
    final String streetSuffix = listing.address?.streetSuffix?? '';
    final String streetDirection = listing.address?.streetDirection?? '';
    String neighborhood = listing.address?.neighborhood?? '';
    final String city = listing.address?.city?? '';
    //final String area = listing.address?.area?? '';
    final String cityArea = listing.address?.area == 'Toronto' ? 'Toronto' : city ;

    final String finalAddress2 = '$neighborhood, $cityArea';
    String finalAddress3 = '';
    if ( finalAddress2.length > 40 ) {
      finalAddress3 = '${finalAddress2.substring(0, 35)}...';
    } else {
      finalAddress3 = finalAddress2;
    }

    // Details
    final String numBedrooms = listing.details?.numBedrooms?? '';
    final String numBedroomsPlus = listing.details?.numBedroomsPlus == '' ? '' : '+${listing.details?.numBedroomsPlus}' ;
    final String numBathrooms = listing.details?.numBathrooms?? '';
    final String numParkingSpacesString = listing.details?.numParkingSpaces?? '';
    final List arrayParkingSpaces = numParkingSpacesString.split('.');
    final String newParkingSpaces = arrayParkingSpaces[0];
    final String depth = listing.lot?.depth?? '';
    final List newDepth = depth.split('.');
    final String noZerosDepth = newDepth[0];
    final String width = listing.lot?.width?? ''; 
    final List newWidth = width.split('.');
    final String noZerosWidth = newWidth[0];
    final String sqft = listing.details?.sqft?? '';
    final String sizeLot = listingClass == 'ResidentialProperty' ? '$noZerosDepth x $noZerosWidth ft.' : '$sqft sqft' ;

    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Stack(
        children: <Widget>[
          ImageFiltered(
            imageFilter: ImageFilter.blur( sigmaX: blurImg, sigmaY: blurImg),
            child: GestureDetector(
              onTap: () {
                if ( loggedIn == true ) {
                  Navigator.pushNamed(context, 'card_details_screen', arguments: listing);
                } else {
                  //Navigator.restorablePopAndPushNamed(context, '/');
                }
              }, 
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: <Widget>[
                        FadeInImage(
                          placeholder: const AssetImage('assets/no-image.jpg'), 
                          image: NetworkImage('https://cdn.repliers.io/$images?w=500'),
                          width: double.infinity,
                          //height: 227,
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration( milliseconds: 300), 
                        ),


                        /* Container(
                          width: 170,
                          padding: const EdgeInsets.only( left: 15.0, top: 5.0, ),
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2E3191),
                            minimumSize: const Size(140.0, 28.0),
                            padding: const EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, 'details', arguments: movie);
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_month_outlined, size: 16,),
                              SizedBox(width: 5,),
                              Text('Listed 7 days ago', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                            ],
                          ),
                          ), 
                        ), */


                        /* Container(
                          width: double.infinity,
                          //height: 207, 
                          padding: const EdgeInsets.fromLTRB( 0, 15, 10, 0),
                          alignment: Alignment.topRight,  
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 1.0,
                                top: 2.0,
                                child: Icon(Icons.filter_9_plus_outlined, color: Colors.black26, size: 30),
                              ),
                              InkWell(
                                child: const Icon(Icons.filter_9_plus_outlined, color: Color(0xFFffffff), size: 30),
                                onTap: () {
                                  Navigator.pushNamed(context, 'card_images_screen', arguments: listing);
                                  //print('object');
                                },
                              )                              
                            ],
                          ),                          
                        ), */
                        /* Container(
                          width: double.infinity,
                          //height: 207, 
                          padding: const EdgeInsets.fromLTRB( 0, 15, 50, 0),
                          alignment: Alignment.topRight,  
                          child: Stack(
                            children: [
                              /* const Positioned(
                                left: 1.0,
                                top: 2.0,
                                child: Icon(Icons.favorite_outlined, color: Colors.black26, size: 30),
                              ), */
                              InkWell(
                                child: const Icon(Icons.favorite_border_outlined, color: Color(0xFFffffff), size: 30),
                                onTap: () {
                                  //print('object');
                                },
                              )                              
                            ],
                          ),                          
                        ), */
                        /* Container(
                          width: double.infinity,
                          height: 207,
                          padding: const EdgeInsets.all(10.0),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: const Image(image: AssetImage('assets/play&learn_chip_53h.png'), ),
                            onTap: () {
                              //print('object');
                            },
                          ),
                        ), */
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0, ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                    //Icon(Icons.attach_money_outlined, color: Color(0xFF90A4AE),),
                                    Text(' $formattedPrice', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF2E3191)),),
                                    //Container( width: 70,),
                                    Container(
                                      padding: const EdgeInsets.symmetric( vertical: 2, horizontal: 5.0 ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: const Color(0xFF2E3191)),
                                      ),
                                      child: Text(propertyType, style: const TextStyle(fontSize: 14, color: Color(0xFF2E3191),),),
                                    ),                          
                                ],   
                              ),
                              const SizedBox(height: 2,),
                              Row(
                                children: [
                                  const Icon(Icons.location_on_outlined, color: Color(0xFF0BB48B), size: 22,),
                                  const SizedBox(width: 2,),
                                  ConstrainedBox(
                                    constraints: BoxConstraints( maxWidth: screenSize.width - 100 ),
                                    child: Text('$unitNumberHyphen$streetNumber $streetName $streetSuffix $streetDirection', style: const TextStyle( fontSize: 16, color: Color(0xFF58595B)), overflow: TextOverflow.ellipsis,)
                                  ),                              
                                ],
                              ),
                              const SizedBox(height: 2,),
                              Row(
                                children: <Widget>[
                                  /* const Icon(Icons.location_on_outlined, color: Color(0xFF0BB48B), size: 26,),
                                  const SizedBox(width: 2,),
                                  ConstrainedBox(
                                    constraints: BoxConstraints( maxWidth: screenSize.width - 140),
                                    child: const Text('18 Wanstead Ave. Scarborough Oakridge', style: TextStyle( fontSize: 18, color: Color(0xFF58595B)), overflow: TextOverflow.ellipsis,)
                                  ), */  
                                  const SizedBox( width: 25.0 ),
                                  Text(finalAddress3, style: const TextStyle( fontSize: 16, color: Color(0xFF58595B)), ),                          
                                ],
                              ),                              
                            ],
                          ),
                        ),
                        const SizedBox(height: 5,),
                        const Divider(  thickness: 0.8, color: Color(0xFF0BB48B), height: 0.0,),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [ 
                            Container(
                              width: 80.0,
                              height: 35.0,
                              decoration: const BoxDecoration(
                                // border: Border.all(color: const Color(0xFF0BB48B))
                                border: Border(
                                  //top: BorderSide(color: Color(0xFF0BB48B)),
                                  //bottom: BorderSide(color: Color(0xFF0BB48B)),
                                  //left: BorderSide(color: Color(0xFF0BB48B)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 9,),
                                  const Icon(Icons.king_bed_outlined, color: Color(0xFF0BB48B), size: 30,),
                                  const SizedBox(width: 5,),
                                  Text('$numBedrooms$numBedroomsPlus', style: const TextStyle( color: Color(0xFF666597), fontWeight: FontWeight.bold, fontSize: 14, ), ),                                  
                                ],
                              ),
                            ),
                            Container(
                              width: 68.0,
                              height: 35.0,
                              //padding: const EdgeInsets.all(3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  //top: BorderSide(color: Color(0xFF0BB48B)),
                                  //bottom: BorderSide(color: Color(0xFF0BB48B)),
                                  left: BorderSide(color: Color(0xFF0BB48B)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 9,),
                                  const Icon(Icons.shower_outlined, color: Color(0xFF0BB48B), size: 30,),
                                  const SizedBox(width: 5,),
                                  Text(numBathrooms, style: const TextStyle( color: Color(0xFF666597), fontWeight: FontWeight.bold, fontSize: 14, ), ),                                  
                                ],
                              ),
                            ),
                            Container(
                              width: 68.0,
                              height: 35.0,
                              //padding: const EdgeInsets.all(3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  //top: BorderSide(color: Color(0xFF0BB48B)),
                                  //bottom: BorderSide(color: Color(0xFF0BB48B)),
                                  left: BorderSide(color: Color(0xFF0BB48B)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(width: 9,),
                                  const Icon(Icons.directions_car_filled_outlined, color: Color(0xFF0BB48B), size: 28,),
                                  const SizedBox(width: 5,),
                                  Text(newParkingSpaces, style: const TextStyle( color: Color(0xFF666597), fontWeight: FontWeight.bold, fontSize: 14, ), ),                                    
                                ],
                              ),
                            ),
                            Container(
                              width: 120.0,
                              height: 35.0,
                              //width: 104.0,
                              //padding: const EdgeInsets.all(3.0),
                              decoration: const BoxDecoration(
                                border: Border(
                                  //top: BorderSide(color: Color(0xFF0BB48B)),
                                  //bottom: BorderSide(color: Color(0xFF0BB48B)),
                                  left: BorderSide(color: Color(0xFF0BB48B)),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  //const Icon(Icons.square_foot, color: Color(0xFF0BB48B), size: 24,),
                                  //const SizedBox(width: 5,),
                                  Text(sizeLot, style: const TextStyle( color: Color(0xFF666597), fontWeight: FontWeight.bold, fontSize: 14, ), )                                    
                                ],
                              ),
                            ),                          
                          ],                          
                        ),                        
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),


          if ( loggedIn == true )
          CardStackItems(listing),


                        /* if ( loggedIn == true )
                        Container(
                          width: 170,
                          padding: const EdgeInsets.only( left: 20.0, top: 10.0, ),
                          alignment: Alignment.topLeft,
                          child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF2E3191),
                            minimumSize: const Size(140.0, 28.0),
                            padding: const EdgeInsets.fromLTRB(7.0, 0.0, 0.0, 0.0),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                          ),
                          onPressed: () {
                            //Navigator.pushNamed(context, 'details', arguments: movie);
                          },
                          child: Row(
                            children: const [
                              Icon(Icons.calendar_month_outlined, size: 16,),
                              SizedBox(width: 5,),
                              Text('Listed 7 days ago', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400))
                            ],
                          ),
                          ), 
                        ),
                        if ( loggedIn == true )
                        Container(
                          width: double.infinity,
                          //height: 207, 
                          padding: const EdgeInsets.fromLTRB( 0, 20, 20, 0),
                          alignment: Alignment.topRight,  
                          child: Stack(
                            children: [
                              const Positioned(
                                left: 1.0,
                                top: 2.0,
                                child: Icon(Icons.filter_9_plus_outlined, color: Colors.black26, size: 30),
                              ),
                              InkWell(
                                child: const Icon(Icons.filter_9_plus_outlined, color: Color(0xFFffffff), size: 30),
                                onTap: () {
                                  Navigator.pushNamed(context, 'card_images_screen', arguments: listing);
                                  //print('object');
                                },
                              )                              
                            ],
                          ),                          
                        ),
                        if ( loggedIn == true )
                        Container(
                          width: double.infinity,
                          //height: 207, 
                          padding: const EdgeInsets.fromLTRB( 0, 20, 60, 0),
                          alignment: Alignment.topRight,  
                          child: Stack(
                            children: [
                              /* const Positioned(
                                left: 1.0,
                                top: 2.0,
                                child: Icon(Icons.favorite_outlined, color: Colors.black26, size: 30),
                              ), */
                              InkWell(
                                child: const Icon(Icons.favorite_border_outlined, color: Color(0xFFffffff), size: 30),
                                onTap: () {
                                  //print('object');
                                },
                              )                              
                            ],
                          ),                          
                        ), */
                        if ( loggedIn == true )
                        Container(
                          width: double.infinity,
                          height: 207,
                          padding: const EdgeInsets.fromLTRB( 0, 0, 20, 0),
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            child: const Image(image: AssetImage('assets/play&learn_chip_53h.png'), ),
                            onTap: () {
                              //print('object');
                            },
                          ),
                        ),



          if ( loggedIn == false )
          Container(
            width: 310,
            height: 430,
            //color: Colors.grey.withOpacity(0.1),
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle( 
                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF5f68be)),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'details', arguments: listing);
              },
              child: const Text('Login required'),
            )
          ),          
        ]
      ),
    );
  }
}
