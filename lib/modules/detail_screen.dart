import 'package:flutter/material.dart';
import '../shared/constant_resources/assets_resources.dart';
import '../widgets/text_widget.dart';

class DetailScreen extends StatefulWidget {
  final String nameEvent;

  const DetailScreen({super.key, required this.nameEvent});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        leading: InkWell(
            onTap: (){
              print("Yes");
              Navigator.pop(context);},
            child: Icon(Icons.arrow_back)),
        flexibleSpace: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Image.asset(AssetResources.appLogo,width: MediaQuery.of(context).size.width/2,fit: BoxFit.contain,), // Replace 'assets/your_logo.png' with your actual logo image path
              onPressed: () {
                // Action when logo is pressed
                print('Logo pressed');
              },
            ),
          ],
        ),

      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            textWidget(
                text: '${widget.nameEvent} page is on maintenance',
                color: Colors.red,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              textAlign: TextAlign.center,
            textLine: 2),
          ],
        ),
      ),
    );
  }
}
