import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:studenthub/ui/company_profile_creation/profile_creation/profile_creation_screen.dart';
import 'package:studenthub/ui/company_profile_creation/welcome_screen.dart';
import 'package:studenthub/ui/home/account/account_screen.dart';
import 'package:studenthub/ui/home/dashboard/project_review/project_review_detail_screen.dart';
import 'package:studenthub/ui/home/home_screen.dart';
import 'package:studenthub/ui/home/messages/chat_detail_screen/chat_detail_screen.dart';
import 'package:studenthub/ui/home/projects/project_detail/project_detail_screen.dart';
import 'package:studenthub/ui/home/projects/submit_proposal/submit_proposal_sceen.dart';
import 'package:studenthub/ui/login/login_screen.dart';
import 'package:studenthub/ui/post_a_project/step_1/project_post_step01_screen.dart';
import 'package:studenthub/ui/post_a_project/step_2/project_post_step02_screen.dart';
import 'package:studenthub/ui/post_a_project/step_3/project_post_step03_screen.dart';
import 'package:studenthub/ui/post_a_project/step_4/project_post_step04_screen.dart';
import 'package:studenthub/ui/introduction/introduction_screen.dart';
import 'package:studenthub/ui/home/projects/project_saved/project_saved_screen.dart';
import 'package:studenthub/ui/home/projects/project_search/project_search_screen.dart';
import 'package:studenthub/ui/signup/signup_step01_screen.dart';
import 'package:studenthub/ui/signup/signup_step02_screen.dart';
import 'package:studenthub/ui/student_profile_creation/student_profile_creation_step_3/student_profile_creation_step_3_screen.dart';
import 'package:studenthub/ui/student_profile_creation/student_profile_creation_step_1/student_profile_creation_step_1_screen.dart';
import 'package:studenthub/ui/student_profile_creation/student_profile_creation_step_2/student_profile_creation_step_2_screen.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const IntroductionScreen();
      },
      routes: [
        GoRoute(
          path: 'project_search',
          name: 'project_search',
          pageBuilder: (context, state) {
            return customTransitionPage(state.pageKey, const ProjectSearchScreen());
          },
        ),
        GoRoute(
          path: 'chat_detail',
          name: 'chat_detail',
          pageBuilder: (context, state) {
            return customTransitionPage(state.pageKey, const ChatDetailScreen());
          },
        ),
        GoRoute(
          path: 'project_saved',
          name: 'project_saved',
          pageBuilder: (context, state) {
            return customTransitionPage(state.pageKey, const ProjectSavedScreen());
          },
        ),
        GoRoute(
            path: 'project_detail',
            name: 'project_detail',
            pageBuilder: (context, state) {
              return customTransitionPage(state.pageKey, ProjectDetailScreen(id: state.uri.queryParameters["id"]!));
            },
            routes: [
              GoRoute(
                path: 'submit_proposal',
                name: 'submit_proposal',
                pageBuilder: (context, state) {
                  return customTransitionPage(state.pageKey, const SubmitProposalScreen());
                },
              ),
            ]),
        GoRoute(
          path: 'project_post',
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox.shrink();
          },
          routes: <RouteBase>[
            GoRoute(
              path: 'step_01',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return customTransitionPage(state.pageKey, const ProjectPostStep01Screen());
              },
            ),
            GoRoute(
              path: 'step_02',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return customTransitionPage(state.pageKey, const ProjectPostStep02Screen());
              },
            ),
            GoRoute(
              path: 'step_03',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return customTransitionPage(state.pageKey, const ProjectPostStep03Screen());
              },
            ),
            GoRoute(
              path: 'step_04',
              pageBuilder: (BuildContext context, GoRouterState state) {
                return customTransitionPage(state.pageKey, const ProjectPostStep04Screen());
              },
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/introduction',
      builder: (BuildContext context, GoRouterState state) {
        return const IntroductionScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/signup_01',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpStep01Screen();
      },
    ),
    GoRoute(
      path: '/signup_02',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpStep02Screen();
      },
    ),
    GoRoute(
      path: '/account',
      builder: (BuildContext context, GoRouterState state) {
        return const AccountScreen();
      },
    ),
    GoRoute(
      path: '/profile_creation',
      builder: (BuildContext context, GoRouterState state) {
        return const ProfileCreationScreen();
      },
    ),
    GoRoute(
      path: '/welcome_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
      path: '/welcome_screen',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreen();
      },
    ),
    GoRoute(
        path: '/student_create_profile',
        builder: (BuildContext context, GoRouterState state) {
          return const StudentProfileCreationStep01Screen();
        },
        routes: [
          GoRoute(
            path: 'step_02',
            builder: (BuildContext context, GoRouterState state) {
              return const StudentProfileCreationStep02Screen();
            },
          ),
          GoRoute(
            path: 'step_03',
            builder: (BuildContext context, GoRouterState state) {
              return const StudentProfileCreationStep3Screen();
            },
          ),
        ]),
    GoRoute(
        path: '/company_review',
        builder: (BuildContext context, GoRouterState state) {
          return const ProjectReviewDetailScreen();
        },
        routes: []),
  ],
);

CustomTransitionPage customTransitionPage(LocalKey key, Widget child) {
  return CustomTransitionPage(
      transitionDuration: const Duration(milliseconds: 250),
      key: key,
      child: child,
      transitionsBuilder:
          (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child);
      });
}
