# 📚 Database Perpustakaan Sekolah  

Repository ini berisi file database serta dokumentasi dalam format PDF untuk sistem perpustakaan sekolah.  

## 📂 Struktur Repository  

- `database.sql` → File SQL yang berisi skema dan data awal database perpustakaan sekolah.  
- `dokumentasi.pdf` → Dokumen berisi contoh soal beserta pengejaan prosedur database.  
- `db_perpustakaan` → Dokumen berisi deskripsi sistem, ERD, serta prosedur penggunaan database.  

## 🔧 Cara Menggunakan  

### 1️⃣ Persiapan  
Pastikan Anda memiliki perangkat lunak database management system (DBMS) yang mendukung SQL, seperti:  
- MySQL  
- MariaDB  
- PostgreSQL (jika file kompatibel)  

### 2️⃣ Mengimpor Database  

#### **Untuk MySQL/MariaDB:**  
1. Buka terminal atau command prompt.  
2. Masuk ke MySQL dengan perintah:  
   ```sh
   mysql -u root -p
   ```
   Masukkan password jika diminta.  
3. Buat database baru:  
   ```sql
   CREATE DATABASE perpustakaan;
   ```
4. Gunakan database tersebut:  
   ```sql
   USE perpustakaan;
   ```
5. Impor file SQL ke dalam database:  
   ```sh
   SOURCE /path/to/database.sql;
   ```
   Gantilah `/path/to/database.sql` dengan lokasi file yang sesuai.  

#### **Untuk phpMyAdmin:**  
1. Buka phpMyAdmin di browser.  
2. Pilih tab **Databases** dan buat database baru dengan nama **perpustakaan**.  
3. Klik database yang telah dibuat, lalu pilih tab **Import**.  
4. Pilih file `database.sql`, lalu klik **Go**.  

### 3️⃣ Verifikasi Database  
Setelah impor selesai, jalankan perintah berikut untuk memastikan tabel dan data telah dimuat:  
```sql
SHOW TABLES;
```
```sql
SELECT * FROM nama_tabel LIMIT 5;
```
Gantilah `nama_tabel` dengan tabel yang ingin diperiksa.  

## 📄 Dokumentasi  
File `dokumentasi.pdf` berisi penjelasan tentang struktur database, hubungan antar tabel, serta contoh query yang dapat digunakan untuk mengelola data perpustakaan.  

## 💡 Catatan  
- Pastikan server database Anda berjalan sebelum melakukan impor.  
- Jika terjadi error saat impor, periksa kembali kompatibilitas database dan encoding file SQL.  
- Jika menggunakan PostgreSQL atau DBMS lain, Anda mungkin perlu menyesuaikan perintah SQL.  

---
