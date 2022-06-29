import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const AccordionApp());
}

class AccordionApp extends StatelessWidget {
  const AccordionApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccordionPage(),
    );
  }
}

/// Main example page
class AccordionPage extends StatelessWidget //__
{
  const AccordionPage({Key? key}) : super(key: key);

  final _headerStyle = const TextStyle(
      color: Color(0xffffffff), fontSize: 15, fontWeight: FontWeight.bold);
  final _contentStyleHeader = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  final _contentStyle = const TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  final _loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text('Accordion'),
        ),
        body: Accordion(
          maxOpenSections: 2,
          headerBackgroundColorOpened: Colors.black54,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
              headerBackgroundColor: Colors.black,
              headerBackgroundColorOpened: Colors.red,
              header: Text('Introduction', style: _headerStyle),
              content: Text(_loremIpsum, style: _contentStyle),
              contentHorizontalPadding: 20,
              contentBorderWidth: 1,
              // onOpenSection: () => print('onOpenSection ...'),
              // onCloseSection: () => print('onCloseSection ...'),
            ),
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
              header: Text('Nested Accordion', style: _headerStyle),
              contentBorderColor: const Color(0xffffffff),
              headerBackgroundColorOpened: Colors.amber,
              content: Accordion(
                maxOpenSections: 1,
                headerBackgroundColorOpened: Colors.black54,
                headerPadding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                children: [
                  AccordionSection(
                    isOpen: true,
                    leftIcon:
                        const Icon(Icons.insights_rounded, color: Colors.white),
                    headerBackgroundColor: Colors.black38,
                    headerBackgroundColorOpened: Colors.black54,
                    header: Text('Nested Section #1', style: _headerStyle),
                    content: Text(_loremIpsum, style: _contentStyle),
                    contentHorizontalPadding: 20,
                    contentBorderColor: Colors.black54,
                  ),
                  AccordionSection(
                    isOpen: true,
                    leftIcon:
                        const Icon(Icons.compare_rounded, color: Colors.white),
                    header: Text('Nested Section #2', style: _headerStyle),
                    headerBackgroundColor: Colors.black38,
                    headerBackgroundColorOpened: Colors.black54,
                    contentBorderColor: Colors.black54,
                    content: Row(
                      children: [
                        const Icon(Icons.compare_rounded,
                            size: 120, color: Colors.orangeAccent),
                        Flexible(
                            flex: 1,
                            child: Text(_loremIpsum, style: _contentStyle)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.food_bank, color: Colors.white),
              header: Text('Company Info', style: _headerStyle),
              content: DataTable(
                sortAscending: true,
                sortColumnIndex: 1,
                dataRowHeight: 40,
                showBottomBorder: false,
                columns: [
                  DataColumn(
                      label: Text('ID', style: _contentStyleHeader),
                      numeric: true),
                  DataColumn(
                      label: Text('Description', style: _contentStyleHeader)),
                  DataColumn(
                      label: Text('Price', style: _contentStyleHeader),
                      numeric: true),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text('1',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Fancy Product', style: _contentStyle)),
                      DataCell(Text(r'$ 199.99',
                          style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('2',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Another Product', style: _contentStyle)),
                      DataCell(Text(r'$ 79.00',
                          style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('3',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(Text('Really Cool Stuff', style: _contentStyle)),
                      DataCell(Text(r'$ 9.99',
                          style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text('4',
                          style: _contentStyle, textAlign: TextAlign.right)),
                      DataCell(
                          Text('Last Product goes here', style: _contentStyle)),
                      DataCell(Text(r'$ 19.99',
                          style: _contentStyle, textAlign: TextAlign.right))
                    ],
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.contact_page, color: Colors.white),
              header: Text('Contact', style: _headerStyle),
              content: Wrap(
                children: List.generate(
                    30,
                    (index) => const Icon(Icons.contact_page,
                        size: 30, color: Color(0xff999999))),
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.computer, color: Colors.white),
              header: Text('Jobs', style: _headerStyle),
              content: const Icon(Icons.computer,
                  size: 200, color: Color(0xff999999)),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.movie, color: Colors.white),
              header: Text('Culture', style: _headerStyle),
              content:
                  const Icon(Icons.movie, size: 200, color: Color(0xff999999)),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.people, color: Colors.white),
              header: Text('Community', style: _headerStyle),
              content:
                  const Icon(Icons.people, size: 200, color: Color(0xff999999)),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.map, color: Colors.white),
              header: Text('Map', style: _headerStyle),
              content:
                  const Icon(Icons.map, size: 200, color: Color(0xff999999)),
            ),
          ],
        ),
      );
} //__
