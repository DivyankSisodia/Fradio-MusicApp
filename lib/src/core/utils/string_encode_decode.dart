String getFirstSentence(String text) {
  int firstFullStopIndex = text.indexOf('.');
  if (firstFullStopIndex != -1) {
    return text.substring(0, firstFullStopIndex + 1).trim();
  }
  return text;
}

String getRemainingText(String text) {
  int firstFullStopIndex = text.indexOf('.');
  if (firstFullStopIndex != -1) {
    return text.substring(firstFullStopIndex + 1).trim();
  }
  return '';
}
