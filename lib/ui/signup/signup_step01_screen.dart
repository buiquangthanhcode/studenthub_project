import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/constants/app_theme.dart';
import 'package:studenthub/constants/colors.dart';
import 'package:studenthub/constants/strings.dart';

class SignUpStep01 extends StatefulWidget {
  const SignUpStep01({super.key});

  @override
  State<SignUpStep01> createState() => _SignUpStep01State();
}

class _SignUpStep01State extends State<SignUpStep01> {
  List<Map<String, dynamic>> dataSelectedInfor = [
    {
      'image': "lib/assets/images/company.png",
      'description': "I am a company,find engineer for project",
      'value': true,
    },
    {
      'image': "lib/assets/images/student.png",
      'description': "I am a student,find project for learning",
      'value': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: backgroundHeaderAppBar,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                NAME_APP,
                style: theme.textTheme.titleMedium,
              ),
              const Icon(Icons.person),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  'Lets Register \nAccount',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Text(
                  'Hello user, you have a greatful journey !',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontSize: 16,
                  ),
                ),
              ),
              ListView.separated(
                shrinkWrap: true,
                itemCount: dataSelectedInfor.length,
                itemBuilder: (context, index) {
                  final item = dataSelectedInfor[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 242, 242, 242),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: theme.colorScheme.grey!,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item['image'],
                              height: 60,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            Expanded(
                                child: Theme(
                              data: ThemeData(
                                unselectedWidgetColor: Colors.black,
                              ),
                              child: Transform.scale(
                                scale: 1.1,
                                child: CheckboxListTile(
                                  activeColor: primaryColor,
                                  visualDensity: VisualDensity.compact,
                                  checkboxShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                                  value: item['value'],
                                  onChanged: (value) {
                                    setState(() {
                                      for (var element in dataSelectedInfor) {
                                        element['value'] = false;
                                      }
                                      item['value'] = value;
                                    });
                                  },
                                ),
                              ),
                            )),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(item['description'],
                            style: theme.textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w400,
                            ))
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 2,
                  );
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 5,
                    minimumSize: Size(maxWidth, 56),
                  ),
                  onPressed: () {
                    context.push('/signup_02');
                  },
                  child: Text(
                    'Create account',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    ' Already have an account? ',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      context.push('/login');
                    },
                    child: Text(
                      'Login',
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}