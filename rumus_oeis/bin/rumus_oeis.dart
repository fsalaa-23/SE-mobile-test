//import 'package:rumus_oeis/rumus_oeis.dart' as rumus_oeis;
import 'dart:io';

void main(List<String> arguments) {
  while (true) {
    print("Fungsi untuk menyelesaikan Rumus A000124 of Sloane's OEIS");
    stdout.write("Input (atau ketik 'exit' untuk keluar): ");
    String? inputText = stdin.readLineSync();

    if (inputText != null && inputText.isNotEmpty) {
      if (inputText.toLowerCase() == 'exit') {
        print("Program selesai.");
        break;
      }

      int? n = int.tryParse(inputText);

      if (n != null) {
        List<int> sequence = generateA000124(n);
        print("Output: ${sequence.join(" : ")}\n");
      } else {
        print("Input harus berupa angka.\n");
      }
    } else {
      print("Input tidak boleh kosong.\n");
    }
  }
}

List<int> generateA000124(int n) {
  List<int> sequence = [];
  for (int i = 0; i < n; i++) {
    sequence.add((i * (i + 1)) ~/ 2 + 1);
  }
  return sequence;
}
