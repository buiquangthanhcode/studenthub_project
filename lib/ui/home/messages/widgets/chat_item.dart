import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/blocs/auth_bloc/auth_bloc.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/models/common/chat_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.chat,
  });

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var colorTheme = Theme.of(context).colorScheme;
    String username =
        chat.sender['id'] != context.read<AuthBloc>().state.userModel.id
            ? chat.sender['fullname']
            : chat.receiver['fullname'];
    String userId = chat.sender['id'] != context.read<AuthBloc>().state.userModel.id
            ? chat.sender['id'].toString()
            : chat.receiver['id'].toString();
    return InkWell(
      onTap: () {
        context.pushNamed('chat_detail', queryParameters: {
          'userName':
              username,
          'userId': userId,
          'projectId': chat.project.id.toString(),
        });
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
            border: Border(
                top: BorderSide(width: 1, color: colorTheme.hintColor!))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: 46,
              height: 46,
              child: CircleAvatar(
                backgroundImage:
                    AssetImage('lib/assets/images/circle_avatar.png'),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          username,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          chat.createAt ?? '',
                          style: textTheme.bodySmall!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: colorTheme.grey,
                              fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    chat.project.title ?? '',
                    style: textTheme.bodySmall!.copyWith(color: primaryColor),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text(
                      chat.content ?? '',
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium!
                          .copyWith(color: colorTheme.hintColor, fontSize: 15),
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
