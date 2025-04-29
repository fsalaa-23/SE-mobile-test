A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# Balanced Bracket

## Deskripsi

Program untuk mengecek string tanda kurung (`{}`, `()`, `[]`) seimbang atau tidak.

## Fungsi

Fungsi `isBalanced(String input)`:

- Menggunakan stack.
- Mengecek setiap tanda kurung dalam satu kali iterasi.

## Kompleksitas

- **Waktu (Time Complexity)**: O(n)
  - Setiap karakter dicek sekali.
  - Operasi push/pop pada stack O(1).
  - Lookup map O(1).
- **Ruang (Space Complexity)**: O(n)
  - Dalam skenario terburuk (semua karakter tanda buka), stack bisa sebesar n.

## Cara Kerja

- Jika karakter tanda kurung buka, masukkan ke stack.
- Jika karakter tanda kurung tutup:
  - Cek apakah stack kosong.
  - Cocokkan dengan pasangan tanda kurung dari map.
- Setelah semua karakter dicek:
  - Jika stack kosong, berarti tanda kurung seimbang (Balanced).
