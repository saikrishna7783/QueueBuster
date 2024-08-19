import 'package:flutter/material.dart';
// import 'package:queue_buster/pages/loading.dart';

import '../widgets/search_bar.dart';

class SelectLocationPage extends StatefulWidget {
  const SelectLocationPage({super.key});

  @override
  State<SelectLocationPage> createState() => _SelectLocationPageState();
}

class _SelectLocationPageState extends State<SelectLocationPage> {

  // bool isLoading = false;

  @override
  Widget build(BuildContext context){
    return const SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 10.0,top: 45),
            //   child: Container(
            //     // color: Colors.lightGreen[500],
            //     height: 60,
            //     width: 280,
            //     decoration: BoxDecoration(
            //       borderRadius: const BorderRadius.all(Radius.elliptical(45, 45)),
            //       color: Colors.lightGreen[500],
            //     ),
            //     child: Padding(
            //       padding: const EdgeInsets.all(18.0),
            //       child: Container(
            //         alignment: Alignment.centerRight,
            //         child: const Icon(Icons.search),
            //       ),
            //     ),
            //   ),
            // ),
            SearchBarApp(),
            Padding(
              padding: EdgeInsets.only(left: 18.0,top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Icon(
                    Icons.location_city,
                    color: Colors.amber,
                  ),

                  SizedBox(width: 10),
                  Center(
                    child: Text(
                      'Few Popular Addresses',
                      style: TextStyle(
                          fontSize: 17,
                          color: Colors.amber,
                          fontWeight: FontWeight.bold
                      ),

                    ),
                  )

                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(28.0),
              child: Divider(
                height: 2,
                thickness: 1,
                color: Colors.grey,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Padding(
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    '- BMS College',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,

                    ),
                  ),
                ),

              ],
            ),



          ],
        ),
      ),
    );
  }
  }


