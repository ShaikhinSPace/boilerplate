extension StringExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((String str) => str.toCapitalized())
      .join(' ');

  String firstLetterCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';

  String firstLetterEachWordCapitalized() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((String str) => str.firstLetterCapitalized())
      .join(' ');

  String firstTwoLetters() => length > 0 ? substring(0, 2) : '';
  String firstName() => isNotEmpty ? (split(' ').firstOrNull ?? '') : '';
  String firstLetter() => length > 0 ? substring(0, 1) : 'U';
}
