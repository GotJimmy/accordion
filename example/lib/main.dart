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
  final _headerStyle = TextStyle(color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = TextStyle(color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 3,
          headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: Icon(Icons.insights_rounded, color: Colors.white),
              header: Text('Introduction', style: _headerStyle),
              content: Text(_loremIpsum, style: _contentStyle),
              contentHorizontalPadding: 20,
              contentBorderWidth: 1,
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.compare_rounded, color: Colors.white),
              header: Text('About Us', style: _headerStyle),
              contentBorderColor: Color(0xffffffff),
              content: Row(
                children: [
                  Icon(Icons.compare_rounded, size: 120, color: Colors.orangeAccent),
                  Flexible(flex: 1, child: Text(_loremIpsum, style: _contentStyle)),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.food_bank, color: Colors.white),
              header: Text('Company Info', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: [
                  DataColumn(label: Text('ID', style: _contentStyleHeader), numeric: true),
                  DataColumn(label: Text('Description', style: _contentStyleHeader)),
                  DataColumn(label: Text('Price', style: _contentStyleHeader), numeric: true),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('1', style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Fancy Product', style: _contentStyle)),
                      DataCell(Text(r'$ 199.99', style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('2', style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Another Product', style: _contentStyle)),
                      DataCell(Text(r'$ 79.00', style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('3', style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Really Cool Stuff', style: _contentStyle)),
                      DataCell(Text(r'$ 9.99', style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('4', style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Last Product goes here', style: _contentStyle)),
                      DataCell(Text(r'$ 19.99', style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.contact_page, color: Colors.white),
              header: Text('Contact', style: _headerStyle),
              content: Wrap(
                children: List.generate(30, (index) => Icon(Icons.contact_page, size: 30, color: Color(0xff999999))),
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.computer, color: Colors.white),
              header: Text('Jobs', style: _headerStyle),
              content: Icon(Icons.computer, size: 200, color: Color(0xff999999)),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.movie, color: Colors.white),
              header: Text('Culture', style: _headerStyle),
              content: Icon(Icons.movie, size: 200, color: Color(0xff999999)),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.people, color: Colors.white),
              header: Text('Community', style: _headerStyle),
              content: Icon(Icons.people, size: 200, color: Color(0xff999999)),
            ),
            // AccordionSection(
            //   isOpen: false,
            //   leftIcon: Icon(Icons.person_add, color: Colors.white),
            //   header: Text('Accordion within Accordion', style: _headerStyle),
            //   contentHorizontalPadding: 15,
            //   contentVerticalPadding: 15,
            //   content: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Flexible(
            //         flex: 1,
            //         child: Text(
            //           '\nTo your right you have an accordion nested within an accordion:',
            //           style: _contentStyle,
            //           textAlign: TextAlign.right,
            //         ),
            //       ),
            //       Container(
            //         width: 200,
            //         height: 200,
            //         child: Accordion(
            //           headerBackgroundColor: Colors.blue[200],
            //           headerPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
            //           contentBackgroundColor: Colors.blue[50],
            //           contentBorderRadius: 10,
            //           children: [
            //             AccordionSection(
            //                 isOpen: false, header: Text('Section #1', style: _headerStyle), content: Text('This is sub-accordion #1 ...', style: _contentStyle)),
            //             AccordionSection(
            //                 isOpen: false, header: Text('Section #2', style: _headerStyle), content: Text('This is sub-accordion #2 ...', style: _contentStyle)),
            //             AccordionSection(
            //                 isOpen: false, header: Text('Section #3', style: _headerStyle), content: Text('This is sub-accordion #3 ...', style: _contentStyle)),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            AccordionSection(
              isOpen: false,
              leftIcon: Icon(Icons.map, color: Colors.white),
              header: Text('Map', style: _headerStyle),
              content: Icon(Icons.map, size: 200, color: Color(0xff999999)),
            ),
          ],
        ),
      );
} //__
