import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/service/school_group_service.dart';
import 'package:panakj_app/ui/view_model/life_status/life_status_bloc.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';

class FieldVerificationScreen extends StatelessWidget {
  const FieldVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            ElevatedButton(
                onPressed: () async {
                  // GetAllFieldVerficationService.lifeStatus();
                  context
                      .read<LifeStatusBloc>()
                      .add(LifeStatusEvent.getlifeStatus());
                },
                child: const Text('post data'))
          ],
        ),
      ),
    );
  }
}
