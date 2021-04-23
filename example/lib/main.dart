import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(AccordionApp());
}

class AccordionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AccordionPage(),
    );
  }
}

class AccordionPage extends StatelessWidget //__
{
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 3,
          headerTextStyle: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          leftIcon: Icon(Icons.audiotrack, color: Colors.white),
          children: [
            AccordionSection(
              isOpen: true,
              headerText: 'Introduction',
              content: Icon(Icons.airplanemode_active, size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: true,
              headerText: 'About Us',
              content: Icon(Icons.airline_seat_flat, size: 120, color: Colors.blue[200]),
            ),
            AccordionSection(
              isOpen: true,
              headerText: 'Company Info',
              content: Icon(Icons.airplay, size: 70, color: Colors.green[200]),
            ),
            AccordionSection(
              isOpen: true,
              headerText: 'Contact',
              content: Icon(Icons.contact_page, size: 300, color: Colors.grey),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Technical Jobs',
              content: Icon(Icons.computer, size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Administrative Jobs',
              content: Icon(Icons.emoji_people, size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Culture',
              content: Icon(Icons.calculate_rounded, size: 200, color: Colors.green),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Community',
              content: Icon(Icons.commute_outlined, size: 200, color: Colors.blueAccent),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Friends Of Us',
              content: Icon(Icons.child_friendly, size: 200, color: Colors.red),
            ),
            AccordionSection(
              isOpen: false,
              headerText: 'Map',
              content: Icon(Icons.map, size: 200, color: Colors.blue),
            ),
          ],
        ),
      );
}//__

