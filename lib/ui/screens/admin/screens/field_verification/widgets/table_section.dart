import 'package:flutter/material.dart';
import 'package:panakj_app/core/constant/constants.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/card/sibling_current_status.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/house_plaster_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/house_plotsize_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/house_rental_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/house_roof_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/life_status_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/parents_education_bottomsheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/marks_section.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/parents_income_bottomsheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/sibling_edu_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/admin/screens/field_verification/widgets/water_source_bottom_sheet.dart';
import 'package:panakj_app/ui/screens/student/screens/academics/widgets/achievments_card.dart';
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
            rows: [
              DataRow(cells: [
                DataCell(Text('Life status', style: homeContentStyle)),
                DataCell(LifeStatusBottomSheet(
                  title: '',
                )
                    // SelectOption(
                    //   options: ['Not alive', 'Disabled', 'Disease'],
                    // ),
                    ),
                DataCell(LifeStatusBottomSheet(
                  title: '',
                )),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Education', style: homeContentStyle)),
                  DataCell(
                      // SelectOption(
                      //   options: ['0 to 4th Std.', '5 to 10th'],
                      // ),
                      ParentsEducationBottomSheet(
                    title: '',
                  )
                      // LifeStatusBottomSheet(
                      //   title: '',
                      // ),
                      ),
                  DataCell(ParentsEducationBottomSheet(
                    title: '',
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Month inc.', style: homeContentStyle)),
                  DataCell(
                    ParentsIncomeBottomSheet(
                      title: '',
                    ),
                  ),
                  DataCell(
                    ParentsIncomeBottomSheet(
                      title: '',
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
          DataTable(
            dividerThickness: 0,
            border: TableBorder.all(
                color: const Color.fromARGB(255, 255, 255, 255)),
            columnSpacing: 75,
            columns: const [
              DataColumn(label: Text('Title')),
              DataColumn(label: Text('Residential Details')),
            ],
            rows: [
              DataRow(cells: [
                const DataCell(Text('Plot size', style: homeContentStyle)),
                DataCell(
                  HousePlotSizeBottomSheet(
                    title: '',
                  ),
                ),
              ]),
              DataRow(
                cells: [
                  DataCell(Text('Roof', style: homeContentStyle)),
                  DataCell(HouseRoofBottomSheet(title: '')),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Plastering', style: homeContentStyle)),
                  DataCell(
                    HousePlasterBottomSheet(
                      title: '',
                    ),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Water Source', style: homeContentStyle)),
                  DataCell(WaterSourceBottomSheet(
                    title: '',
                  )),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text('Rental House', style: homeContentStyle)),
                  DataCell(HouseRentalBottomSheet(
                    title: '',
                  )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// class SiblingsTable extends StatelessWidget {
//   const SiblingsTable({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Column(
//         children: [
//           const Row(
//             children: [],
//           ),
//           DataTable(
//             dividerThickness: 0,
//             border: TableBorder.all(
//                 color: const Color.fromARGB(255, 255, 255, 255)),
//             columnSpacing: 75,
//             columns: const [
//               DataColumn(label: Text('Title')),
//               DataColumn(label: Text('Siblings Details')),
//             ],
//             rows: [
//               DataRow(cells: [
//                 const DataCell(Text('1st to 10th', style: homeContentStyle)),
//                 DataCell(SiblingEducationalBottomSheet(
//                   title: '',
//                 )),
//                 // DataCell(LifeStatusBottomSheet(
//                 //   title: '',
//                 // )),
//               ]),
//               DataRow(
//                 cells: [
//                   const DataCell(Text('11th to 12th', style: homeContentStyle)),
//                   DataCell(LifeStatusBottomSheet(
//                     title: '',
//                   )),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   const DataCell(Text('College', style: homeContentStyle)),
//                   DataCell(LifeStatusBottomSheet(
//                     title: '',
//                   )),
//                 ],
//               ),
//               DataRow(
//                 cells: [
//                   const DataCell(
//                       Text('Disabled/Sick', style: homeContentStyle)),
//                   DataCell(LifeStatusBottomSheet(
//                     title: '',
//                   )),
//                 ],
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class EducationalTable extends StatelessWidget {
  const EducationalTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: [
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

class SiblingsTable extends StatelessWidget {
  const SiblingsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Siblings Section'),
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          child: SiblingCurrentStatusCard(),
        ),
      ],
    );
  }
}
