import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panakj_app/core/colors/colors.dart';
import 'package:panakj_app/core/constant/constants.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text('FormScreen'),
          ],
        ),
      )),
    );
  }
}
