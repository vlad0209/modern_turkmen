import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../data/repositories/tutorial/tutorial_repository.dart';
import '../../domain/models/tutorial/tutorial.dart';

part 'contents_table_view_model.g.dart';

@riverpod
class ContentsTableViewModel extends _$ContentsTableViewModel {
  late TutorialRepository _tutorialRepository;
  late LanguageRepository _languageRepository;
  
  @override
  Stream<List<Tutorial>> build() {
    _tutorialRepository = ref.watch(tutorialRepositoryProvider);
    _languageRepository = ref.watch(languageRepositoryProvider);
    return _tutorialRepository.getTutorialsStream();
  }

  void toggleLocale() {
    _languageRepository.toggleLocale();
  }
}