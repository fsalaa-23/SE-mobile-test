import 'dart:io';

bool isBalanced(String input) {
  List<String> stack = [];
  Map<String, String> bracketPairs = {')': '(', '}': '{', ']': '['};

  for (var char in input.split('')) {
    if (char == '(' || char == '{' || char == '[') {
      stack.add(char);
    } else if (char == ')' || char == '}' || char == ']') {
      if (stack.isEmpty || stack.last != bracketPairs[char]) {
        return false;
      }
      stack.removeLast();
    }
  }
  return stack.isEmpty;
}

void main() {
  while (true) {
    print("\nBalanced Bracket");

    stdout.write("Input : ");
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {
      print("Input tidak boleh kosong.");
      continue;
    }

    print(isBalanced(input.replaceAll(' ', '')) ? "YES" : "NO");

    stdout.write("\nApakah anda ingin cek lagi? [Y/T]: ");
    String? lagi = stdin.readLineSync();

    if (lagi == null || lagi.toUpperCase() != 'Y') {
      print("Program berhenti");
      break;
    }
  }
}
