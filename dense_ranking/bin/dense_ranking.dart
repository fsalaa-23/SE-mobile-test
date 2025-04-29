import 'dart:io';

void main() {
  while (true) {
    print("\nDense Ranking Game GITS");

    // Input jumlah pemain
    stdout.write("Masukkan jumlah pemain: ");
    int? jumlahPemain = int.tryParse((stdin.readLineSync() ?? ''));

    if (jumlahPemain == null || jumlahPemain <= 0) {
      print("Jumlah pemain tidak valid.");
      continue;
    }

    // Input daftar skor pemain
    stdout.write("Masukkan skor pemain (pisahkan dengan spasi): ");
    List<int>? daftarSkor = parseInput(stdin.readLineSync());

    if (daftarSkor == null || daftarSkor.length != jumlahPemain) {
      print("Jumlah skor tidak sesuai jumlah pemain.");
      continue;
    }

    // Input jumlah permainan GITS
    stdout.write("Masukkan jumlah game yang dimainkan GITS: ");
    int? jumlahPermainan = int.tryParse(stdin.readLineSync() ?? '');

    if (jumlahPermainan == null || jumlahPermainan <= 0) {
      print("Jumlah permainan tidak valid.");
      continue;
    }

    // Input skor yang dimainkan GITS
    stdout.write("Masukkan skor GITS (pisahkan dengan spasi): ");
    List<int>? skorGITS = parseInput(stdin.readLineSync());

    if (skorGITS == null || skorGITS.length != jumlahPermainan) {
      print("Jumlah skor GITS tidak sesuai jumlah permainan.");
      continue;
    }

    // Hitung Ranking
    List<int> hasilRanking = hitungRanking(daftarSkor, skorGITS);

    // Output hasil
    print("\nOutput: ");
    print(hasilRanking.join(" "));

    // Tanya mau coba lagi atau tidak
    stdout.write("\nApakah anda ingin mencoba lagi? [Y/T]: ");
    String? cobaLagi = stdin.readLineSync();

    if (cobaLagi == null || (cobaLagi.toUpperCase() != 'Y')) {
      print("Program berhenti");
      break;
    }
  }
}

List<int>? parseInput(String? input) {
  try {
    if (input == null) return null;
    return input.split(' ').map((e) => int.parse(e)).toList();
  } catch (e) {
    return null;
  }
}

List<int> hitungRanking(List<int> daftarSkor, List<int> skorGITS) {
  // Buat ranking untuk skor pemain
  List<int> uniqueScores =
      daftarSkor.toSet().toList()..sort((b, a) => a.compareTo(b)); // Descending

  List<int> hasil = [];
  for (int skor in skorGITS) {
    int posisi = 0;
    while (posisi < uniqueScores.length && skor < uniqueScores[posisi]) {
      posisi++;
    }
    hasil.add(posisi + 1);
  }
  return hasil;
}
