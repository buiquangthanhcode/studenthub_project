import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/widgets/bulletWidget.dart';

class ProjectDetailScreen extends StatefulWidget {
  const ProjectDetailScreen({super.key, required this.id, this.isHiddenAppbar});

  final String id;
  final bool? isHiddenAppbar;

  @override
  State<ProjectDetailScreen> createState() => _ProjectDetailScreenState();
}

class _ProjectDetailScreenState extends State<ProjectDetailScreen> {
  bool? isSaved;

  @override
  void initState() {
    super.initState();
    isSaved = false;
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: widget.isHiddenAppbar ?? false
          ? null
          : AppBar(
              centerTitle: false,
              titleSpacing: 0,
              title: Text(
                "Project detail",
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: InkWell(
                    onTap: () {
                      isSaved = !isSaved!;
                      setState(() {});
                    },
                    child: FaIcon(
                      isSaved! ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
                      color: primaryColor,
                    ),
                  ),
                )
              ],
            ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Senior frontend developer (Fintech)',
                  style: textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  color: Colors.grey, // Set the color of the divider
                  thickness: 2, // Set the thickness of the divider
                  height: 20, // Set the height of the divider
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Students are looking for',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.6),
                          ),
                    ),
                    BulletList(const [
                      'Clear expectation about your project or deliverables',
                      'The skill required for your project',
                      'Detail about your project',
                    ]),
                  ],
                ),
                const Divider(
                  color: Colors.grey, // Set the color of the divider
                  thickness: 2, // Set the thickness of the divider
                  height: 20, // Set the height of the divider
                ),
              ],
            ),
            const SizedBox(height: 12),
            Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.access_alarm, size: 42),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Project scope',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircle,
                                  size: 6,
                                ),
                              ),
                              Text(
                                '3-6 months',
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: Colors.black.withOpacity(0.8),
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.people, size: 42),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student required',
                            style: TextStyle(color: Colors.black.withOpacity(0.8)),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(8),
                                child: FaIcon(
                                  FontAwesomeIcons.solidCircle,
                                  size: 6,
                                ),
                              ),
                              Text(
                                '6 students',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.black.withOpacity(0.8)),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            // const SizedBox(height: 24),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Saved',
                      style: textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 56),
                    ),
                    onPressed: () {
                      context.push('/project_detail/submit_proposal');
                    },
                    child: Text(
                      'Apply Now',
                      style: textTheme.bodyMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
