import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/colors.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({
    super.key,
    required this.paddingRight, required this.icon,
  });

  final double paddingRight;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
        TextTheme textTheme = Theme.of(context).textTheme;
    var colorTheme = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.fromLTRB(0, 16, paddingRight, 16),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(width: 1, color: colorTheme.hintColor!))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Created 3 days ago',
                      style:
                          textTheme.bodySmall!.copyWith(color: colorTheme.grey),
                    ),
                    Text(
                      'Senior frontend developer (Fintech)',
                      style: textTheme.bodySmall!.copyWith(color: primaryColor),
                    ),
                    Text(
                      'Time: 1-3 months, 6 students needed',
                      style: textTheme.bodySmall!.copyWith(
                        color: colorTheme.grey,
                      ),
                    ),
                  ],
                ),
              ),
              FaIcon(
                icon,
                color: primaryColor,
              )
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Students are looking for',
            style: textTheme.bodySmall!,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(6),
                      child: FaIcon(
                        FontAwesomeIcons.solidCircle,
                        size: 6,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Clear expectation about your project or deliverables',
                        style: textTheme.bodySmall!,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text('Proposal: Less than 5',
              style: textTheme.bodySmall!.copyWith(color: colorTheme.grey)),
        ],
      ),
    );
  }
}
