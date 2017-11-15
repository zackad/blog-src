---
layout: post
title: Menghitung Usability Factor Arah Runway Bandara dengan MySQL Database
category: id
---
Salah satu tahap dalam perencanaan bandara adalah menentukan arah *runway* dengan memperhatikan kondisi angin di lokasi. Dalam artikel singkat ini akan dijelaskan bagaimana menghitung *usability factor* dengan menggunakan database sebagai alat bantu analisis.

## Apa saja yang dibutuhkan?

1. Data arah angin selama 5 tahun terakhir sesuai dengan yang disyaratkan oleh ICAO (International Civil Aviation Organisation). Data ini bisa diperoleh di stasiun pengamatan BMKG terdekat dengan lokasi.
2. MySQL database sebagai alat bantu analisis
3. MySQL client sebagai antar muka (interface) user dengan system database. (HeidiSQL, MySQL Workbench)

## Tahap 1 — Mempersiapkan dan memformat database

Pada tahap ini, kita akan mempersiapkan tabel sebagai tempat penyimpanan data. Adapun tabel yang dibutuhkan meliputi :
- tabel data angin
- tabel rencana arah runway
- tabel waktu pencatatan data angin (opsional)
- tabel lokasi stasiun pengamatan (opsional)

> **Catatan:** tabel yang bersifat opsional akan berguna ketika kita akan melakukan analisis windrose dengan menggunakan aplikasi **WRPlot View**.

Dari daftar tabel diatas, kita bisa membuat tabel baru dengan perintah:

```sql
-- Membuat tabel data angin
CREATE TABLE IF NOT EXISTS 'data_angin' (
    -- Kolom opsional, berguna untuk export data ke format .lakes
    'id_sta_pengamatan' int(11) DEFAULT NULL,   -- id dari tabel stasiun pengamatan
    'tanggal' date DEFAULT NULL,                -- format 'YYYY-MM-DD'
    'kecepatan_angin' double DEFAULT NULL,      -- satuan Knot
    'arah_angin' int(11) DEFAULT NULL           -- satuan derajat (°) dengan 0° = utara
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Membuat tabel arah runway
CREATE TABLE IF NOT EXISTS 'arah_runway' (
    ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
```

## Tahap 2 — Menginput data
## Tahap 3 — Membuat fungsi analisis
## Tahap 4 — Menghitung usability factor

## Referensi

- http://www.archerfieldairport.com.au/Downloads/Masterplan2011/TP1_Wind%20Usability%20Analysis.pdf
