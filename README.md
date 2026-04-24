								Modular Folder Structure
		
Proyek ini menggunakan struktur folder yang modular untuk memisahkan logika dari UI:

models/: Berisi article_model.dart untuk memetakan data JSON dari API menjadi objek Dart.
services/: Berisi api_service.dart untuk menangani HTTP request ke API.
repositories/: Mengelola pengambilan data dari API sebelum dikirim ke provider.
providers/: Berisi article_provider.dart sebagai State Management penghubung data dan UI.
views/: Berisi halaman utama aplikasi.
widgets/: Berisi reusable widget seperti card dan search bar untuk menjaga konsistensi UI.
local/: Berisi cache_service.dart untuk menyimpan data menggunakan SharedPreferences agar aplikasi tetap dapat digunakan saat offline.


							Alasan Memilih Provider (State Management)

Efisiensi Kode & Kerapian: Provider memisahkan business logic dari UI dengan lebih rapi dibandingkan menggunakan setState.
Performa: Hanya bagian UI yang membutuhkan data saja yang akan di-rebuild saat terjadi perubahan state.
Mudah Dipahami: Cocok untuk aplikasi skala kecil hingga menengah dan mudah dikembangkan untuk fitur tambahan seperti search dan filter.
