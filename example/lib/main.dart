import 'package:accordion/accordion.dart';
import 'package:accordion/controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  static const headerStyle = TextStyle(
      color: Color(0xffffffff), fontSize: 18, fontWeight: FontWeight.bold);
  static const contentStyleHeader = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.w700);
  static const contentStyle = TextStyle(
      color: Color(0xff999999), fontSize: 14, fontWeight: FontWeight.normal);
  static const loremIpsum =
      '''Lorem ipsum is typically a corrupted version of 'De finibus bonorum et malorum', a 1st century BC text by the Roman statesman and philosopher Cicero, with words altered, added, and removed to make it nonsensical and improper Latin.''';
  static const slogan =
      'Do not forget to play around with all sorts of colors, backgrounds, borders, etc.';

  const AccordionPage({super.key});

  @override
  build(context) => Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: const Text('Accordion'),
        ),
        body: Accordion(
          headerBorderColor: Colors.blueGrey,
          headerBorderColorOpened: Colors.transparent,
          // headerBorderWidth: 1,
          headerBackgroundColorOpened: Colors.green,
          contentBackgroundColor: Colors.white,
          contentBorderColor: Colors.green,
          contentBorderWidth: 3,
          contentHorizontalPadding: 20,
          scaleWhenAnimating: true,
          openAndCloseAnimation: true,
          headerPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
          sectionOpeningHapticFeedback: SectionHapticFeedback.heavy,
          sectionClosingHapticFeedback: SectionHapticFeedback.light,
          children: [
            AccordionSection(
              isOpen: true,
              contentVerticalPadding: 20,
              leftIcon:
                  const Icon(Icons.text_fields_rounded, color: Colors.white),
              header: const Text('Simple Text', style: headerStyle),
              content: const Text(loremIpsum, style: contentStyle),
            ),
            AccordionSection(
              isOpen: true,
              leftIcon: const Icon(Icons.input, color: Colors.white),
              header: const Text('Text Field & Button', style: headerStyle),
              contentHorizontalPadding: 40,
              contentVerticalPadding: 20,
              content: const MyInputForm(),
            ),
            AccordionSection(
              isOpen: true,
              leftIcon:
                  const Icon(Icons.child_care_rounded, color: Colors.white),
              header: const Text('Nested Accordion', style: headerStyle),
              content: const MyNestedAccordion(),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.shopping_cart, color: Colors.white),
              header: const Text('DataTable', style: headerStyle),
              content: const MyDataTable(),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon:
                  const Icon(Icons.circle_outlined, color: Colors.black54),
              rightIcon: const Icon(
                Icons.keyboard_arrow_down,
                color: Colors.black54,
                size: 20,
              ),
              headerBackgroundColor: Colors.transparent,
              headerBackgroundColorOpened: Colors.amber,
              headerBorderColor: Colors.black54,
              headerBorderColorOpened: Colors.black54,
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.amber,
              contentBorderColor: Colors.black54,
              contentBorderWidth: 1,
              contentVerticalPadding: 30,
              header: const Text('Custom: Header with Border',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.label_important_outline_rounded,
                    size: 50,
                  ).paddingOnly(right: 20),
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.black45, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBackgroundColor: Colors.deepOrange,
              headerBackgroundColorOpened: Colors.brown,
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.brown,
              contentBorderWidth: 0,
              contentVerticalPadding: 30,
              header: const Text('Custom: Other Colors', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.label_important_outline_rounded,
                    size: 50,
                    color: Colors.white54,
                  ).paddingOnly(right: 20),
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBackgroundColor: Colors.green[900],
              headerBackgroundColorOpened: Colors.lightBlue,
              headerBorderColorOpened: Colors.yellow,
              headerBorderWidth: 10,
              contentBackgroundColor: Colors.lightBlue,
              contentBorderColor: Colors.yellow,
              contentBorderWidth: 10,
              contentVerticalPadding: 30,
              header: const Text('Custom: Heavy Borders', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.label_important_outline_rounded,
                    size: 50,
                    color: Colors.white54,
                  ).paddingOnly(right: 20),
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBorderRadius: 30,
              headerBackgroundColor: Colors.purple,
              headerBackgroundColorOpened: Colors.purple,
              headerBorderColorOpened: Colors.white,
              headerBorderWidth: 2,
              contentBackgroundColor: Colors.purple,
              contentBorderColor: Colors.white,
              contentBorderWidth: 2,
              contentBorderRadius: 100,
              contentVerticalPadding: 30,
              header: const Text('Custom: Very Round', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.label_important_outline_rounded,
                    size: 50,
                    color: Colors.white54,
                  ).paddingOnly(right: 20),
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            AccordionSection(
              isOpen: false,
              leftIcon: const Icon(Icons.circle, color: Colors.white),
              headerBorderRadius: 0,
              headerBackgroundColor: Colors.black87,
              headerBackgroundColorOpened: Colors.black87,
              headerBorderColorOpened: const Color(0xffaaaaaa),
              headerBorderWidth: 1,
              contentBackgroundColor: Colors.black54,
              contentBorderColor: const Color(0xffaaaaaa),
              contentBorderWidth: 1,
              contentBorderRadius: 0,
              contentVerticalPadding: 30,
              header: const Text('Android', style: headerStyle),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.label_important_outline_rounded,
                    size: 50,
                    color: Colors.white54,
                  ).paddingOnly(right: 20),
                  const Flexible(
                    child: Text(
                      slogan,
                      maxLines: 4,
                      style: TextStyle(color: Colors.white54, fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
} //__

class MyInputForm extends StatelessWidget //__
{
  const MyInputForm({super.key});

  @override
  Widget build(context) //__
  {
    return Column(
      children: [
        TextFormField(
          decoration: InputDecoration(
            label: const Text('Some text goes here ...'),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ).marginOnly(bottom: 10),
        ElevatedButton(
          onPressed: () {},
          child: const Text('Submit'),
        )
      ],
    );
  }
}

class MyDataTable extends StatelessWidget //__
{
  const MyDataTable({super.key});

  @override
  Widget build(context) //__
  {
    return DataTable(
      sortAscending: true,
      sortColumnIndex: 1,
      showBottomBorder: false,
      columns: const [
        DataColumn(
            label: Text('ID', style: AccordionPage.contentStyleHeader),
            numeric: true),
        DataColumn(
            label:
                Text('Description', style: AccordionPage.contentStyleHeader)),
        DataColumn(
            label: Text('Price', style: AccordionPage.contentStyleHeader),
            numeric: true),
      ],
      rows: const [
        DataRow(
          cells: [
            DataCell(Text('1',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(Text('Fancy Product', style: AccordionPage.contentStyle)),
            DataCell(Text(r'$ 199.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('2',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(
                Text('Another Product', style: AccordionPage.contentStyle)),
            DataCell(Text(r'$ 79.00',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('3',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(
                Text('Really Cool Stuff', style: AccordionPage.contentStyle)),
            DataCell(Text(r'$ 9.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
        DataRow(
          cells: [
            DataCell(Text('4',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right)),
            DataCell(Text('Last Product goes here',
                style: AccordionPage.contentStyle)),
            DataCell(Text(r'$ 19.99',
                style: AccordionPage.contentStyle, textAlign: TextAlign.right))
          ],
        ),
      ],
    );
  }
}

class MyNestedAccordion extends StatelessWidget //__
{
  const MyNestedAccordion({super.key});

  @override
  Widget build(context) //__
  {
    return Accordion(
      paddingListTop: 0,
      paddingListBottom: 0,
      maxOpenSections: 1,
      headerBackgroundColorOpened: Colors.black54,
      headerPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      children: [
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.insights_rounded, color: Colors.white),
          headerBackgroundColor: Colors.black38,
          headerBackgroundColorOpened: Colors.black54,
          header:
              const Text('Nested Section #1', style: AccordionPage.headerStyle),
          content: const Text(AccordionPage.loremIpsum,
              style: AccordionPage.contentStyle),
          contentHorizontalPadding: 20,
          contentBorderColor: Colors.black54,
        ),
        AccordionSection(
          isOpen: true,
          leftIcon: const Icon(Icons.compare_rounded, color: Colors.white),
          header:
              const Text('Nested Section #2', style: AccordionPage.headerStyle),
          headerBackgroundColor: Colors.black38,
          headerBackgroundColorOpened: Colors.black54,
          contentBorderColor: Colors.black54,
          content: const Row(
            children: [
              Icon(Icons.compare_rounded,
                  size: 120, color: Colors.orangeAccent),
              Flexible(
                  flex: 1,
                  child: Text(AccordionPage.loremIpsum,
                      style: AccordionPage.contentStyle)),
            ],
          ),
        ),
      ],
    );
  }
}
