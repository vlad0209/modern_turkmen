mixin Localizer {
  String localizeField(String languageCode, Map<String, dynamic> data, String fieldName) {
    return data['${fieldName}_$languageCode'] as String? ??
        data['${fieldName}_en'] as String? ??
        '';
  }
}