# Sistem Pemantauan Kualitas Udara dengan Peringatan Otomatis
Proyek Akhir Mata Kuliah Sistem Siber Fisik 2024 Kelompok 8 

## Daftar Isi
- [Pengantar dan Solusi dari Permasalahan](#pengantar-dan-solusi-dari-permasalahan)
- [Desain dan Implementasi Perangkat Keras](#desain-dan-implementasi-perangkat-keras)
- [Detail Implementasi Perangkat Lunak](#detail-implementasi-perangkat-lunak)
- [Hasil Pengujian dan Evaluasi Kinerja](#hasil-pengujian-dan-evaluasi-kinerja)
- [Kesimpulan](#kesimpulan)

## Pengantar dan Solusi dari Permasalahan
### Pengantar
Kualitas udara yang buruk merupakan masalah serius yang berdampak langsung pada kesehatan masyarakat, menyebabkan gangguan pernapasan dan penyakit kardiovaskular akibat peningkatan polutan seperti karbon monoksida (CO). Sistem pemantauan kualitas udara konvensional seringkali terbatas dalam mobilitas, biaya, dan kecepatan respon, tidak mampu memberikan data real-time dan membutuhkan biaya tinggi untuk instalasi serta pemeliharaan. Oleh karena itu, diperlukan sistem pemantauan kualitas udara yang efektif, efisien, dan terjangkau untuk mengurangi risiko kesehatan dari udara tercemar.
### Solusi
Untuk mengatasi masalah kualitas udara, sistem AIRSAFE menggunakan mikrokontroler Arduino atmega328p dan sensor gas MQ-2 sebagai solusi efektif pemantauan real-time. Sistem ini terdiri dari dua Arduino: Arduino-1 mengolah data dari sensor yang mendeteksi gas berbahaya seperti karbon monoksida (CO) dan mengirimkannya ke Arduino-2 melalui protokol I2C untuk memberikan peringatan.

Data kualitas udara ditampilkan pada layar LCD, serta tiga LED (hijau, kuning, merah) dan alarm sebagai indikator visual dan auditori: hijau untuk kualitas baik, kuning untuk sedang, dan merah untuk buruk. Ketika kadar CO melebihi batas aman, LED merah menyala dan alarm berbunyi, memungkinkan pengguna segera bertindak. Dengan respons cepat terhadap perubahan kualitas udara dan kontrol pemrograman menggunakan bahasa assembly, teknologi ini diharapkan dapat meningkatkan efektivitas pemantauan kualitas udara dan pemahaman teknologi Arduino dan assembly.

## Desain dan Implementasi Perangkat Keras
### Desain Perangkat Keras
Adapun peralatan yang digunakan adalah sebagai berikut:
- Sensor Asap MQ-2 (1)
- Arduino UNO ATmega328p (2)
- 
### Implementasi Perangkat Keras

## Detail Implementasi Perangkat Lunak
Describe the software components, including any algorithms, libraries, and frameworks used.

## Hasil Pengujian dan Evaluasi Kinerja
Present the results of your testing, including any performance metrics, and evaluate the system’s performance.

## Kesimpulan
Summarize the project outcomes and discuss potential improvements and future work.
