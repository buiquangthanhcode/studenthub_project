import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/blocs/auth_bloc/auth_bloc.dart';
import 'package:studenthub/blocs/project_bloc/project_bloc.dart';
import 'package:studenthub/blocs/project_bloc/project_event.dart';
import 'package:studenthub/blocs/project_bloc/project_state.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/core/show_modal_bottomSheet.dart';
import 'package:studenthub/models/common/project_model.dart';
import 'package:studenthub/ui/home/dashboard/data/data_count.dart';
import 'package:studenthub/ui/home/dashboard/widgets/more_action_widget.dart';
import 'package:studenthub/ui/home/dashboard/widgets/project_review_item.dart';
import 'package:studenthub/ui/home/dashboard/widgets/tab/project_all_tab/project_all_tab_for_student.dart';
import 'package:studenthub/utils/helper.dart';
import 'package:studenthub/utils/logger.dart';
import 'package:studenthub/widgets/emtyDataWidget.dart';

class ProjectWorkingTabForStudent extends StatefulWidget {
  const ProjectWorkingTabForStudent({super.key});

  @override
  State<ProjectWorkingTabForStudent> createState() => _ProjectAllTabState();
}

class _ProjectAllTabState extends State<ProjectWorkingTabForStudent> {
  List<Project> projects = [];
  @override
  void initState() {
    super.initState();
    context.read<ProjectBloc>().add(
          GetWorkingProjectsEvent(),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        if (state.workingProjects.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              EmptyDataWidget(
                mainTitle: '',
                subTitle: 'No project working yet.',
                widthImage: MediaQuery.of(context).size.width * 0.5,
              ),
            ],
          );
        }
        return Container(
          margin: const EdgeInsets.only(top: 20),
          child: Center(
            child: ListView.separated(
              itemCount: state.workingProjects.length,
              itemBuilder: (context, index) {
                return ProjectReviewItem(
                    theme: theme, item: state.allProjects[index]);
              },
              separatorBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Divider(),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
