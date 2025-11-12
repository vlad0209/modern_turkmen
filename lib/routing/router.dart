import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:modern_turkmen/ui/widgets/exercise_screen.dart';

import '../config/dependencies.dart';
import '../ui/widgets/contents_table_screen.dart';
import '../ui/widgets/result_screen.dart';
import '../ui/widgets/tutorial_screen.dart';
import '../ui/widgets/welcome_screen.dart';

GoRouter router(String? tutorialId, WidgetRef ref) => GoRouter(
        initialLocation: tutorialId != null && tutorialId.isNotEmpty
            ? '/tutorial/$tutorialId'
            : '/',
        routes: [
          GoRoute(
              path: '/welcome',
              builder: (context, state) {
                return const WelcomeScreen();
              }),
          GoRoute(
            path: '/refresh',
            builder: (context, state) {
              final url = state.extra as String?;
              Future.delayed(Duration.zero, () {
                if (context.mounted) {
                  context.go(url ?? '/');
                }
              });
              return SizedBox();
            },
          ),
          GoRoute(
              path: '/',
              redirect: (context, state) async {
                final onboardingRepository =
                    ref.read(onboardingRepositoryProvider);
                final isFirstLaunch =
                    await onboardingRepository.isFirstLaunch();
                if (isFirstLaunch) {
                  return '/welcome';
                } else {
                  return null;
                }
              },
              builder: (_, __) {
                return ContentsTableScreen();
              },
              routes: [
                GoRoute(
                    path: 'tutorial/:id',
                    builder: (context, state) {
                      return TutorialScreen(
                          tutorialId: state.pathParameters['id']!);
                    },
                    routes: [
                      GoRoute(
                        path: 'exercise/:language/:exerciseId',
                        builder: (context, state) {
                          return ExerciseScreen(
                            tutorialId: state.pathParameters['id']!,
                            exerciseId: state.pathParameters['exerciseId']!,
                            locale: state.pathParameters['language']!,
                          );
                        },
                      ),
                      GoRoute(
                          path: 'result',
                          builder: (context, state) {
                            final params = state.extra as ResultParams;
                            return ResultScreen(
                                solvedItemsCount: params.solvedItemsCount,
                                notSolvedItemsCount: params.notSolvedItemsCount,
                                tutorialId: params.tutorialId,
                                nextExerciseId: params.nextExerciseId,
                                nextTutorialId: params.nextTutorialId);
                          })
                    ])
              ])
        ]);
