import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class FieldVerificationScreen extends StatelessWidget {
  const FieldVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
               appBar: PreferredSize(
        preferredSize: const Size.fromHeight(67.0),
        child: AppBar(
  elevation: 4,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {
     
            },
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
          title: Text(
            'Pankaj Trust',
            style: GoogleFonts.mPlus1p(
              color: Colors.black,
            ),
          ),
        ),
      ),
     
     
     
      body: const SafeArea(
          child: Center(
            child: Column(
                  children: [SizedBox(height: 30),
            Text('FieldVerificationScreen'),
                  ],
                ),
          )),
    );
  }
}
