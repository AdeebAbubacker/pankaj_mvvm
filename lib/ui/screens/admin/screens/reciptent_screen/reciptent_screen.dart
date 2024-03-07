import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/ui/view_model/recipients/recipents_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panakj_app/core/constant/constants.dart';

class ReciepentSCreen extends StatefulWidget {
  ReciepentSCreen({super.key});

  @override
  State<ReciepentSCreen> createState() => _ReciepentSCreenState();
}

class _ReciepentSCreenState extends State<ReciepentSCreen> {
  void initState() {
    BlocProvider.of<RecipentsBloc>(context)
        .add(RecipentsEvent.getallRecipients());
    // TODO: implement initState
    super.initState();
  }

  List<Recipient> recipients = [
    Recipient(name: 'Jayakrishnan Thoppil', imagePath: 'assets/jk.jpg'),
    Recipient(name: 'Varsha T.K', imagePath: 'assets/varsha.png'),
    Recipient(name: 'Prithvi Pramodh', imagePath: 'assets/prithvi.png'),
    Recipient(name: 'Aswathy Santhosh', imagePath: 'assets/PSC.jpg'),
    Recipient(name: 'Rishikesh P.S', imagePath: 'assets/hrishi.png'),
    Recipient(name: 'Vishnu Surendran', imagePath: 'assets/vishnu.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    // BlocProvider.of<RecipientsBloc>(context)
    //     .add(const RecipientsEvent.getRecipients());
    return Scaffold(
      backgroundColor: const Color(0xFFf4f4f4),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
          elevation: 4,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.menu,
              color: Color.fromARGB(
                255,
                75,
                75,
                74,
              ),
            ),
          ),
          centerTitle: true,
          title: Text('Pankaj Trust',
              style: GoogleFonts.mPlus1p(color: Colors.black)),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Scholarship Recipients',
                          style: recepeintdashcontent
                          // style: TextStyle(
                          //   fontSize: 19,
                          //   fontWeight: FontWeight.w500,
                          // ),
                          ),
                    ),
                  ],
                ),
                // BlocBuilder<RecipientsBloc, RecipientsState>(
                //   builder: (context, state) {
                //     if (state.isLoading) {
                //       return const CircularProgressIndicator();
                //     }
                //     return Text('${state.recipient[0].start_year}');
                //   },
                // ),
                // const Text('data'),

                BlocBuilder<RecipentsBloc, RecipentsState>(
                  builder: (context, state) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(9),
                      shrinkWrap: true,
                      itemCount: state.recipients.length,
                      itemBuilder: (context, index) {
                        return StudentReciptentCard(
                          image: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 215, 202, 202)),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            width: 90,
                            height: 100,
                            child: const Icon(Icons.person, size: 30),
                          ),
                          name: state.recipients[index].name.toString(),
                          student_id:
                              state.recipients[index].start_year.toString(),
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StudentReciptentCard extends StatelessWidget {
  final Widget image;
  final String name;
  final String student_id;
  const StudentReciptentCard(
      {super.key,
      required this.image,
      required this.name,
      required this.student_id});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 9),
      child: Container(
        width: 120,
        height: 180,
        decoration: BoxDecoration(
            border: Border.all(
                color: const Color.fromARGB(255, 216, 206, 206), width: 1),
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: const BorderRadius.all(Radius.circular(5))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FirstRow(image: image, name: name, student_id: student_id),
            // const SizedBox(
            //   height: 10,
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: SizedBox(
                width: 170,
                height: 40,
                child: OutlinedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black)),
                  onPressed: () {},
                  child: const Text(
                    'Student details',
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstRow extends StatelessWidget {
  const FirstRow({
    super.key,
    required this.image,
    required this.name,
    required this.student_id,
  });

  final Widget image;
  final String name;
  final String student_id;

  String truncateString(String text, {int maxLength = 16}) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: image,
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            children: [
                              Text(
                                truncateString(name),
                                style: const TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Year recieved: ',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                            Text(
                              student_id,
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Row(
                          children: [
                            Icon(
                              Icons.school_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 232, 13, 13),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              'GHSS Tripunitara',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w300),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(
                              Icons.person_outlined,
                              size: 20,
                              color: Color.fromARGB(255, 255, 64, 163),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              '22',
                              style: TextStyle(
                                  fontSize: 11, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )),
          ],
        )
      ],
    );
  }
}

class Recipient {
  final String name;
  final String imagePath;

  Recipient({required this.name, required this.imagePath});
}
