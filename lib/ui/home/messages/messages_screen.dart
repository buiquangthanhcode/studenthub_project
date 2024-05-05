import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:studenthub/blocs/chat_bloc/chat_bloc.dart';
import 'package:studenthub/blocs/chat_bloc/chat_event.dart';
import 'package:studenthub/blocs/chat_bloc/chat_state.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/key_translator.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/ui/home/messages/data/get_chat_data.dart';
import 'package:studenthub/ui/home/messages/widgets/chat_item.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, this.isHiddenAppbar});

  final bool? isHiddenAppbar;
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<MessagesScreen> {
  final searchController = TextEditingController();
  final FocusNode _searchFocus = FocusNode();

  @override
  void initState() {
    // _value = widget.value;
    _searchFocus.addListener(_onFocusChange);

    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   showWelcomeDialog(context);
    // });
    context.read<ChatBloc>().add(
          GetAllDataEvent(),
        );

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _searchFocus.removeListener(_onFocusChange);

    _searchFocus.dispose();
  }

  void _onFocusChange() {
    setState(() {});
  }

  final data = getChatList();
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    var colorTheme = Theme.of(context).colorScheme;

    return BlocBuilder<ChatBloc, ChatState>(
        builder: (BuildContext context, ChatState state) {
      return Scaffold(
        appBar: widget.isHiddenAppbar ?? false
            ? null
            : AppBar(
                automaticallyImplyLeading: false,
                centerTitle: false,
                title: Text(
                  // 'Messages',
                  messagesNavKey.tr(),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
              ),
        body: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        focusNode: _searchFocus,
                        onChanged: (value) {
                          if (value.isEmpty || value.length == 1) {
                            setState(() {});
                          }
                        },
                        cursorHeight: 18,
                        controller: searchController,
                        cursorColor: Colors.black,
                        style: textTheme.bodyMedium,
                        decoration: InputDecoration(
                          hintText: searchForMsgKey.tr(),
                          hintStyle: textTheme.bodyMedium!.copyWith(
                              color: colorTheme.brightness == Brightness.dark
                                  ? Colors.white
                                  : Theme.of(context).colorScheme.hintColor),
                          prefixIcon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.magnifyingGlass,
                                color: colorTheme.black,
                              ),
                            ],
                          ),
                          suffixIcon: searchController.text.isNotEmpty
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        searchController.clear();
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 18,
                                        height: 18,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: colorTheme.brightness ==
                                                  Brightness.dark
                                              ? primaryColor
                                              : const Color.fromARGB(
                                                  255, 191, 191, 191),
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.xmark,
                                          color: Colors.white,
                                          size: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(width: 1),
                          suffixIconConstraints:
                              const BoxConstraints(minWidth: 50),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 12),
                          isDense: true,
                          filled: true,
                          fillColor: colorTheme.brightness == Brightness.dark
                              ? primaryColor
                              : const Color.fromARGB(255, 245, 245, 245),
                          errorStyle: const TextStyle(height: 0),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          // disabledBorder: const OutlineInputBorder(
                          //   borderSide: BorderSide(width: 0),
                          //   borderRadius: BorderRadius.all(Radius.circular(8)),
                          // ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 0,
                              style: BorderStyle.none,
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.chatList.length,
                    itemBuilder: (context, index) => ChatItem(
                          chat: state.chatList[index],
                        )),
              ),
            ],
          ),
        ),
      );
    });
  }
}
