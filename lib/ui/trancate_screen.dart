import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:panakj_app/core/service/5mvservice.dart';
import 'package:panakj_app/core/service/auth_service.dart';
import 'package:panakj_app/core/service/family_service.dart';

class EditStudentData extends StatelessWidget {
  EditStudentData({super.key});
  final AuthService authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await FamilyInfoService().postfamilyInfoservice(
                    falive: '',
                    fdisabled: '',
                    fincome: '',
                    fname: '',
                    mname: '',
                    mincome: '',
                    malive: 's',
                    mdisabled: '',
                    foccupation: '',
                    galive: '',
                    gdisabled: '',
                    gincome: '',
                    gname: '',
                    goccupation: '',
                    moccupation: '',
                    
                  //  SiblingsdatafromHive: 's'
                  );
                },
                child: Text('s'))
            // ElevatedButton(
            //   onPressed: () async {
            //     // Call the postPersonalInfoservice method with required parameters

            //     // await FamilyInfoService().postfamilyInfoservice(
            //     //   fincome: '2',
            //     //   fname: '2',
            //     //   falive: '0',
            //     //   fdisabled: '2',
            //     //   foccupation: '2',
            //     // );

            //     // await fivemvService().postPersonalInfoservice();
            //     // Handling success, you may navigate to another page or show a success message
            //     print('Personal info posted successfully');
            //   },
            //   child: const Text('Post Personal Info'),
            // ),
          ],
        ),
      ),
    );
  }
}
