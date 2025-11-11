import 'package:modern_turkmen/data/repositories/language/language_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../config/dependencies.dart';
import '../../domain/models/language.dart';

part 'language_view_model.g.dart';

@riverpod
class LanguageViewModel extends _$LanguageViewModel {
  late LanguageRepository _languageRepository;
  @override
  Language build() {
    _languageRepository = ref.watch(languageRepositoryProvider);
    _languageRepository.addListener(() {
      state = _languageRepository.currentLanguage;
    });
    return _languageRepository.currentLanguage;
  }

  void setLanguage(String languageCode) {
    _languageRepository.setLanguage(languageCode);
  }
}