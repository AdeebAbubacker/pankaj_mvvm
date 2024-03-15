import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/model/auth_response/auth_response.dart';
import 'package:panakj_app/core/service/auth_service.dart';
import 'package:panakj_app/core/service/family_service.dart';
import 'package:panakj_app/core/service/post_personalinfoservice.dart';
import 'package:panakj_app/ui/view_model/update_studentinvite_list/update_studentinvite_list_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                // Call the postPersonalInfoservice method with required parameters

                await SampleServcie().sampleServcie();
                // Handling success, you may navigate to another page or show a success message
                print('Personal info posted successfully');
              },
              child: Text('Post Personal Info'),
            ),
          ],
        ),
      ),
    );
  }
}
