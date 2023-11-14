import 'package:flutter/material.dart';
import 'package:rsl_app/modules/detail_screen.dart';
import '../widgets/count_down.dart';
import '../widgets/drawer.dart';
import '../shared/constant_resources/assets_resources.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/text_widget.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  List eventsData = [
    {
      'name':'Races',
      'icon':'assets/images/finish-flag.png'
    },
    {
      'name':'Reservations',
      'icon':'assets/images/tent.png'
    },
    {
      'name':'Commercial',
      'icon':'assets/images/home.png'
    },
    {
      'name':'Tawajudi',
      'icon':'assets/images/location.png'
    },
    {
      'name':'Liwa Village',
      'icon':'assets/images/village.png'
    },
    {
      'name':'Festival guide',
      'icon':'assets/images/guide.png'
    },
    {
      'name':'Tickets',
      'icon':'assets/images/ticket.png'
    },
    {
      'name':'More',
      'icon':'assets/images/menu.png'
    },

  ];

  List locationEvent = [
    {
      'name':'Racing Event',
      'Description':"Held in Dubai",
      'image':'assets/images/1.png'
    },
    {
      'name':'Tent Event',
      'Description':"Held in Ajman",
      'image':'assets/images/2.png'
    },
    {
      'name':'Reservation',
      'Description':"Reservation in Abu Dabi open",
      'image':'assets/images/3.png'
    },
    {
      'name':'Racing Event',
      'Description':"Held in Dubai",
      'image':'assets/images/1.png'
    },
    {
      'name':'Tent Event',
      'Description':"Held in Ajman",
      'image':'assets/images/2.png'
    },
    {
      'name':'Reservation',
      'Description':"Reservation in Abu Dabi open",
      'image':'assets/images/3.png'
    }
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      _scrollController.animateTo(_scrollController.position.maxScrollExtent,
          duration: Duration(minutes: 1), curve: Curves.linear);
    });

    //👉 If you want infinite scrolling use the following code
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // Scroll has reached the end, reset the position to the beginning.
        _scrollController.jumpTo(_scrollController.position.minScrollExtent);
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SingleChildScrollView(
        child: Column(
          children: [
           const Padding(
             padding: EdgeInsets.all(20.0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                 CountDownWidget(nameEvent: 'Race',),
                 CountDownWidget(nameEvent: 'Events',),
                 CountDownWidget(nameEvent: 'places',),
               ],
             ),
           ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4, // number of items in each row
                  mainAxisSpacing: 8.0, // spacing between rows
                  crossAxisSpacing: 8.0,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.4),
                  // spacing between columns
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                padding: const EdgeInsets.all(1.0), // padding around the grid
                itemCount: eventsData.length, // total number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(nameEvent: eventsData[index]['name'])),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade100, spreadRadius: 2),
                          ],
                        ),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Image.asset(eventsData[index]['icon'],
                            )),
                            const SizedBox(height: 10),
                            textWidget(
                                text: eventsData[index]['name'],
                                color: Colors.red,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Container(
              height: 190.0,
              child: ListView.builder(
                shrinkWrap: true,
                controller: _scrollController,
                reverse: false,
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(1.0), // padding around the grid
                itemCount: locationEvent.length, // total number of items
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => DetailScreen(nameEvent: eventsData[index]['name'])),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.2,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(color: Colors.grey.shade100, spreadRadius: 2),
                          ],
                        ),
                        clipBehavior: Clip.antiAlias, // Add this line
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(child: ClipRect(child: Image.asset(locationEvent[index]['image'],fit: BoxFit.fill,width: MediaQuery.of(context).size.width / 2,))),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0,bottom: 5.0,top: 3),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textWidget(
                                      text: locationEvent[index]['name'],
                                      color: Colors.red,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                  SizedBox(height: 2,),
                                  textWidget(
                                      text: locationEvent[index]['Description'],
                                      color: Colors.red,
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}
