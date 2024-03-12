import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:panakj_app/core/service/get_all_fieldverification_service.dart';
import 'package:panakj_app/ui/view_model/alive_ordisabled_fieldadmin/alive_ordisabled_fieldadmin_bloc.dart';
import 'package:panakj_app/ui/view_model/life_status/life_status_bloc.dart';
import 'package:panakj_app/ui/view_model/personalInfo/personal_info_bloc.dart';
import 'package:panakj_app/ui/view_model/school_group/school_group_bloc.dart';
import 'package:panakj_app/ui/view_model/students_app_form/students_app_form_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 50),
            BlocListener<AliveOrdisabledFieldadminBloc,
                AliveOrdisabledFieldadminState>(
              listener: (context, state) {
                // Add any side effects or actions based on state changes here.
              },
              child: BlocBuilder<AliveOrdisabledFieldadminBloc,
                  AliveOrdisabledFieldadminState>(
                builder: (context, state) {
                  return Checkbox(
                    value: state.alivetrue,
                    onChanged: (value) {
                      context
                          .read<AliveOrdisabledFieldadminBloc>()
                          .add(AliveOrdisabledFieldadminEvent.togglealive());
                    },
                  );
                },
              ),
            ),
            BlocListener<AliveOrdisabledFieldadminBloc,
                AliveOrdisabledFieldadminState>(
              listener: (context, state) {
                // Add any side effects or actions based on state changes here.
              },
              child: BlocBuilder<AliveOrdisabledFieldadminBloc,
                  AliveOrdisabledFieldadminState>(
                builder: (context, state) {
                  return Checkbox(
                    value: state.notalivefalse,
                    onChanged: (value) {
                      context
                          .read<AliveOrdisabledFieldadminBloc>()
                          .add(AliveOrdisabledFieldadminEvent.togglenotalive());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
