import 'package:flutter/material.dart';


import '../widgets/text_widget.dart';
import '../shared/constant_resources/assets_resources.dart';

Widget commonDrawer(){
  return Drawer(
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.red,
            ),
            child: Row(
              children: [
                ClipRect(child: Image.asset(AssetResources.appLogo,width: 50,)),
                const SizedBox(width: 10.0,),
                textWidget(text: 'Welcome In LIWA Club', color: Colors.white,fontSize: 16),
              ],
            )
        ),
        ListTile(
          title:  textWidget(text: 'Home', color: Colors.black,fontSize: 16),
          leading: const Icon(Icons.home),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: textWidget(text: 'About club', color: Colors.black,fontSize: 16),
          leading: const Icon(Icons.access_alarm),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          title: textWidget(text: 'News', color: Colors.black,fontSize: 16),
          leading: const Icon(Icons.access_alarm),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),

        ListTile(
          title: textWidget(text: 'Profile', color: Colors.black,fontSize: 16),
          leading: const Icon(Icons.access_alarm),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
      ],
    ),
  );
}