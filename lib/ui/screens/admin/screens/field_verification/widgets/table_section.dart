import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/select_option.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/marks_section.dart';
import 'package:panakj_app/ui/screens/student/widgets/spacer_height.dart';

class ParentsTable extends StatelessWidget {
  const ParentsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          Row(
            children: [
              const HeightSpacer(),
              Image.asset(
                'assets/father.jpg',
                width: 120,
              ),
              const SizedBox(width: 35),
              Image.asset(
                'assets/mother.jpg',
                width: 45,
              )
            ],
          ),
          DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
                color: const Color.fromARGB(255, 255, 255, 255)),
            columnSpacing: 15,
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Father')),
              DataColumn(label: Text('Mother')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Life status', style: homeContentStyle)),
                DataCell(
                  SelectOption(
                    options: ['Not alive', 'Disabled', 'Disease'],
                  ),
                ),
                DataCell(
                  SelectOption(
                    options: ['Not alive', 'Disabled', 'Disease'],
                  ),
                ),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Education', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: ['0 to 4th Std.', '5 to 10th'],
                    ),
                  ),
                  DataCell(
                    SelectOption(
                      options: ['0 to 4th Std.', '5 to 10th'],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Month inc.', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        'Rs. 0 to 3,000',
                        'Rs. 3,001 to 5,000',
                        'Rs. 5001 to 8,000',
                        'Rs. 8,001 to 12,000',
                        'Rs. 12,001 to 15,000',
                        'Rs. 15,001 to 18,000'
                      ],
                    ),
                  ),
                  DataCell(
                    SelectOption(
                      options: [
                        'Rs. 0 to 3,000',
                        'Rs. 3,001 to 5,000',
                        'Rs. 5001 to 8,000',
                        'Rs. 8,001 to 12,000',
                        'Rs. 12,001 to 15,000',
                        'Rs. 15,001 to 18,000'
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResidentialTable extends StatelessWidget {
  const ResidentialTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Row(
            children: [],
          ),
          DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
                color: const Color.fromARGB(255, 255, 255, 255)),
            columnSpacing: 75,
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Residential Details')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('Plot size', style: homeContentStyle)),
                DataCell(
                  SelectOption(
                    options: [
                      '0 to 5 cents',
                      '6 to 10 cents',
                      '11 to 15 cents',
                      '16 to 20 cents',
                      '21 to 30 cents',
                    ],
                  ),
                ),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Roof', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        'Thatched',
                        'Tin/Asbest.',
                        'Tile',
                        'Concrete',
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Plastering', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        'None Outside',
                        'None Inside',
                        'None Floor',
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Water Source', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        'Pub. Tap',
                        'Pond',
                        'Well',
                        'Pvt. Tap',
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Rental House', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        'Rs. 0 to 1,000',
                        'Rs. 1001 to 2,000',
                        'Rs. 2001 to 3,000',
                        'Rs. 3001 to 4,000',
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SiblingsTable extends StatelessWidget {
  const SiblingsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Row(
            children: [],
          ),
          DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
                color: const Color.fromARGB(255, 255, 255, 255)),
            columnSpacing: 75,
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Siblings Details')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1st to 10th', style: homeContentStyle)),
                DataCell(
                  SelectOption(
                    options: [
                      '0',
                      '1',
                      '2',
                      '3',
                    ],
                  ),
                ),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('11th to 12th', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        '0',
                        '1',
                        '2',
                        '3',
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('College', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        '0',
                        '1',
                        '2',
                        '3',
                      ],
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Disabled/Sick', style: homeContentStyle)),
                  DataCell(
                    SelectOption(
                      options: [
                        '0',
                        '1',
                        '2',
                        '3',
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class EducationalTable extends StatelessWidget {
  const EducationalTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
          const Row(
            children: [],
          ),
          DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
                color: const Color.fromARGB(255, 255, 255, 255)),
            columnSpacing: 75,
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Educational Details')),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('SSLC', style: homeContentStyle)),
                DataCell(MarksSection()),
              ]),
              DataRow(cells: [
                DataCell(Text('Extra C', style: homeContentStyle)),
                DataCell(MarksSection()),
              ]),
              DataRow(cells: [
                DataCell(Text('Plus Two', style: homeContentStyle)),
                DataCell(MarksSection()),
              ]),
            ],
          ),
        ],
      ),
    );
  }
}
