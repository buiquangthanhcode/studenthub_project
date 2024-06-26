import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studenthub/blocs/auth_bloc/auth_bloc.dart';
import 'package:studenthub/blocs/student_bloc/student_bloc.dart';
import 'package:studenthub/blocs/student_bloc/student_event.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/constants/key_translator.dart';
import 'package:studenthub/core/show_modal_bottomSheet.dart';
import 'package:studenthub/data/dto/student/request_post_experience.dart';
import 'package:studenthub/models/student/student_create_profile/project_model.dart';
import 'package:studenthub/ui/home/account/student_profile_creation/widget/edit_project_resume.dart';
import 'package:studenthub/utils/helper.dart';
import 'package:studenthub/widgets/dialog.dart';
import 'package:studenthub/widgets/snack_bar_config.dart';

class ProjectResumeItem extends StatelessWidget {
  const ProjectResumeItem({super.key, required this.item});

  final ProjectResume item;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Theme(
      data: ThemeData(
        dividerColor: Colors.transparent,
        unselectedWidgetColor: primaryColor,
        colorScheme: const ColorScheme.light(
          primary: Colors.black,
          onPrimary: Colors.black,
        ),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: theme.colorScheme.grey!.withOpacity(0.2),
          ),
        ),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          childrenPadding: const EdgeInsets.all(0),
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          controlAffinity: ListTileControlAffinity.leading,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              FaIcon(
                FontAwesomeIcons.tags,
                size: 18,
                // color: theme.colorScheme.grey!,
                color: Theme.of(context).brightness == Brightness.light
                    ? theme.colorScheme.grey!
                    : Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                item.title ?? '',
                style: theme.textTheme.bodyMedium,
              ),
              const Spacer(),
              GestureDetector(
                child: FaIcon(
                  FontAwesomeIcons.penToSquare,
                  size: 18,
                  color: theme.colorScheme.grey!,
                ),
                onTap: () {
                  showModalBottomSheetCustom(context,
                      widgetBuilder: EditProjectResumeItem(item: item));
                },
              ),
              const SizedBox(width: 10),
              GestureDetector(
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.grey!.withOpacity(0.08),
                    shape: BoxShape.circle,
                  ),
                  child: const FaIcon(
                    FontAwesomeIcons.xmark,
                    size: 18,
                    color: Colors.red,
                  ),
                ),
                onTap: () {
                  showDialogCustom(
                    context,
                    image: 'lib/assets/images/delete.png',
                    // title: 'Are you sure you want to delete this experience?',
                    title: deleteExperienceConfirmMsg.tr(),
                    textButtom: deleteBtnKey.tr(),
                    // textButtom: 'Delete',
                    // subtitle: 'This action cannot be undone',
                    subtitle: thisActionCannotBeUndoneKey.tr(),
                    onSave: () {
                      final student = context.read<StudentBloc>().state.student;

                      final currentExperience = student.experiences;
                      for (var element in currentExperience!) {
                        if (element.id == item.id) {
                          currentExperience.remove(element);
                          break;
                        }
                      }

                      RequestPostExperience requestPostExperience =
                          RequestPostExperience(
                        experience: currentExperience,
                        userId: context
                            .read<AuthBloc>()
                            .state
                            .userModel
                            .student!
                            .id
                            .toString(),
                      );
                      context.read<StudentBloc>().add(AddProjectEvent(
                            experience: requestPostExperience,
                            onSuccess: () {
                              SnackBarService.showSnackBar(
                                  // content: "Delete Sucessfully",
                                  content: deleteSuccessMsg.tr(),
                                  status: StatusSnackBar.success);
                              Navigator.pop(context);
                            },
                          ));
                    },
                  );
                },
              ),
              const SizedBox(width: 10),
            ],
          ),
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: theme.colorScheme.grey!.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SizedBox(
                      height: 2,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          FaIcon(
                            FontAwesomeIcons.calendar,
                            size: 18,
                            color: theme.colorScheme.grey!,
                          ),
                          const SizedBox(width: 7),
                          Text(
                            '${formatDateTime(parseMonthYear(item.startMonth), format: 'MM/yyyy')} - ${formatDateTime(parseMonthYear(item.endMonth), format: 'MM/yyyy')}',
                          ),
                          Builder(builder: (context) {
                            int duration = calculateMonthDifference(
                                stringToDateTime(item.startMonth),
                                stringToDateTime(item.endMonth));
                            return duration != 0
                                ? Text(
                                    ', $duration  months',
                                  )
                                : const SizedBox();
                          }),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    // 'Skillset',
                    skillSetKey.tr(),
                    style: theme.textTheme.bodyMedium,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Builder(builder: (context) {
                    if (item.skillSets?.isNotEmpty ?? false) {
                      return Wrap(
                        spacing: 2.0,
                        runSpacing: 6.0,
                        direction: Axis.horizontal,
                        children: item.skillSets!
                            .map((item) => Container(
                                  margin: const EdgeInsets.only(left: 10),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Text(
                                          item.name ?? '',
                                          style: theme.textTheme.bodyMedium
                                              ?.copyWith(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.circleInfo,
                        size: 18,
                        color: theme.colorScheme.grey!,
                      ),
                      const SizedBox(width: 7),
                      Text(
                        // 'Description',
                        descriptionPlaceHolderKey.tr(),
                        style: theme.textTheme.bodyMedium,
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 25),
                    child: Text(
                      item.description ?? '',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.colorScheme.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
