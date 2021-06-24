import 'dart:math';

//Password Generator Function
String passwordGenerator({
  bool lower = true,
  bool upper = false,
  bool numbers = false,
  bool symbols = false,
  int length = 8,
}) {
  List<int> password = [];

  List<int> characters = [];
  if (lower) characters += CharacterCodes.lowerCaseList;
  if (upper) characters += CharacterCodes.upperCaseList;
  if (numbers) characters += CharacterCodes.numberList;
  if (symbols) characters += CharacterCodes.symbolsList;

  if ((lower == true || upper == true) ||
      (numbers == true || symbols == true)) {
    bool validPassword = false;

    while (!validPassword) {
      //creates a new password string from array of available characters based on input parameters
      for (int i = 0; i < length; i++) {
        var ranNum = new Random();
        password.add(characters[ranNum.nextInt(characters.length - 1)]);
      }

      //checks to see if generated code has atleast one of each selected character type
      if (parseChar(password, CharacterCodes.lowerCaseList) ||
          (lower == false)) {
        if (parseChar(password, CharacterCodes.upperCaseList) ||
            (upper == false)) {
          if (parseChar(password, CharacterCodes.numberList) ||
              (numbers == false)) {
            if (parseChar(password, CharacterCodes.symbolsList) ||
                (symbols == false)) {
              validPassword = true;
            }
          }
        }
      }

      //empties password array if not a valid password
      if (!validPassword) {
        password = [];
      }
    }
  }
  return new String.fromCharCodes(password);
}

class CharacterCodes {
  static List<int> upperCaseList = characterListGenerator(65, 90);
  static List<int> lowerCaseList = characterListGenerator(97, 122);
  static List<int> symbolsList = characterListGenerator(33, 47) +
      characterListGenerator(58, 64) +
      characterListGenerator(91, 96) +
      characterListGenerator(123, 126);
  static List<int> numberList = characterListGenerator(48, 57);
}

//Creates a list of characters based on range of character codes 
List<int> characterListGenerator(int start, int end) {
  List<int> characters = [];

  for (int i = start; i <= end; i++) {
    characters.add(i);
  }
  return characters;
}

//checks to see if password has atleast on character from provided list of character codes
bool parseChar(List<int> generatedList, List<int> codeList) {
  for (int i = 0; i < generatedList.length; i++) {
    if (codeList.any((element) => element == generatedList[i])) {
      return true;
    }
  }
  return false;
}
