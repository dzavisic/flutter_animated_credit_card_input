String replaceCharAt(String oldString, int index, String newChar) {
  if (index == 0) {
    return newChar + oldString.substring(1);
  }
  return oldString.substring(0, index) + newChar + oldString.substring(index + 1);
}