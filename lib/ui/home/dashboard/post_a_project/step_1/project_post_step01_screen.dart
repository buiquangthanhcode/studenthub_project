import 'dart:developer';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:studenthub/blocs/project_bloc/project_bloc.dart';
import 'package:studenthub/blocs/project_bloc/project_event.dart';
import 'package:studenthub/blocs/project_bloc/project_state.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/key_translator.dart';
import 'package:studenthub/models/common/project_model.dart';
import 'package:studenthub/widgets/bulletWidget.dart';

class ProjectPostStep01Screen extends StatefulWidget {
  const ProjectPostStep01Screen({super.key});

  @override
  State<ProjectPostStep01Screen> createState() =>
      _ProjectPostStep01ScreenState();
}

class _ProjectPostStep01ScreenState extends State<ProjectPostStep01Screen> {
  final TextEditingController _textEditingController = TextEditingController();
  final GlobalKey<FormState> _formKeyPostStep01 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProjectBloc, ProjectState>(
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            toolbarHeight: 80,
            centerTitle: false,
            titleSpacing: 0,
            title: Text(
              newPostTitleKey.tr(),
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: CircularPercentIndicator(
                  animation: true,
                  // animationDuration: 10000,
                  radius: 60,
                  lineWidth: 6,
                  percent: 0.25,
                  progressColor: const Color(0xff3961FB),
                  backgroundColor: const Color(0xff3961FB).withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    // '1 of 4',
                    oneOfFourKey.tr(),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 13,
                        ),
                  ),
                ),
              )
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
            child: Form(
              key: _formKeyPostStep01,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newPostTitleDescriptionKey.tr(),
                    maxLines: 3,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          // color: Colors.black.withOpacity(0.6),
                          color:
                              Theme.of(context).brightness == Brightness.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.white,
                        ),
                  ),
                  const SizedBox(height: 48),
                  TextFormField(
                    controller: _textEditingController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Khoong duoc de trong';
                      }
                      return null;
                    },
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Colors.black), // Adjust the font size as needed
                    decoration: InputDecoration(
                      hintText: newPostTitlePlacerHolderKey.tr(),
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium!.copyWith(
                                color: const Color.fromARGB(255, 149, 148, 148),
                              ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                          width: 4.0,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal:
                              12 // Adjust the vertical padding as needed
                          ),
                    ),
                    onChanged: (value) {
                      setState(() {});
                    },
                  ),
                  const SizedBox(height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        newPostTitleExampleKey.tr(),
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              // color: Colors.black.withOpacity(0.6),
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      BulletList([
                        newPostTitleExample1Key.tr(),
                        newPostTitleExample2Key.tr(),
                      ])
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKeyPostStep01.currentState?.validate() ??
                          false) {
                        final currentProject = Project(
                          title: _textEditingController.text,
                        );
                        context
                            .read<ProjectBloc>()
                            .add(UpdateNewProjectEvent(currentProject));
                        context.push('/home/project_post/step_02');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16), // Adjust padding as needed
                      minimumSize: const Size(
                          double.infinity, 48), // Set minimum button size
                      backgroundColor: (_textEditingController.text.isNotEmpty)
                          ? const Color(0xff3961FB)
                          : const Color(0xff3961FB).withOpacity(0.5),
                    ),
                    child: Text(
                      continueBtnKey.tr(),
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
