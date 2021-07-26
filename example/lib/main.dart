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
  final _headerStyle =
      TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold);

  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 1,
          leftIcon: Icon(Icons.audiotrack, color: Colors.white),
          children: [
            AccordionSection(
              isOpen: true,
              header: Text('Introduction', style: _headerStyle),
              content: Icon(Icons.airplanemode_active,
                  size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: true,
              header: Text('About Us', style: _headerStyle),
              content: Icon(Icons.airline_seat_flat,
                  size: 120, color: Colors.blue[200]),
            ),
            AccordionSection(
              isOpen: true,
              header: Text('Company Info', style: _headerStyle),
              content: Icon(Icons.airplay, size: 70, color: Colors.green[200]),
            ),
            AccordionSection(
              isOpen: true,
              header: Text('Contact', style: _headerStyle),
              content: Icon(Icons.contact_page, size: 300, color: Colors.grey),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Technical Jobs', style: _headerStyle),
              content: Icon(Icons.computer, size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Administrative Jobs', style: _headerStyle),
              content: Icon(Icons.emoji_people, size: 200, color: Colors.amber),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Culture', style: _headerStyle),
              content:
                  Icon(Icons.calculate_rounded, size: 200, color: Colors.green),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Community', style: _headerStyle),
              content: Icon(Icons.commute_outlined,
                  size: 200, color: Colors.blueAccent),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Friends Of Us', style: _headerStyle),
              content: Icon(Icons.child_friendly, size: 200, color: Colors.red),
            ),
            AccordionSection(
              isOpen: false,
              header: Text('Map', style: _headerStyle),
              content: Icon(Icons.map, size: 200, color: Colors.blue),
            ),
          ],
        ),
      );
}//__
