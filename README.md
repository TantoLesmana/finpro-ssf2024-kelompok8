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
- Arduino UNO ATmega328p (1)
- Modul I2C (1)
- LCD (1)
- LED (3)
- Resistor 10k (3)

### Implementasi Perangkat Keras
Desain rangkaian kami dibuat dengan menggunakan aplikasi Proteus. Rangkaian dibuat sedemikian rupa dengan menggunakan dua arduino dengan mengimplementasikan modul I2C untuk menjalankan penampilan hasil pembacaan dan pendeteksian sensor terpisah dari peringatan LED dan buzzer. Buzzer dirangkai dengan konfigurasi sedemikian rupa agar dapat menyala ketika BJT dalam kondisi switching oleh karena arus yang mengalir pada terminal base dari BJT NPN. Push button pada rangkaian dirangkai secara negative logic pull-up yang menyebabkan pin PD2 akan selalu berada kondisi HIGH hingga push button ditekan. Setiap LED dilengkapi oleh resistor untuk membatasi tegangan yang lewat pada masing-masing LED.

## Detail Implementasi Perangkat Lunak
### Desain Perangkat Lunak
Untuk mempermudah pembuatan dari alat tersebut, akan menguntungkan apabila dibuat sebuah flowchart untuk mengetahui alur dari kerja alat tersebut.

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245036177933864980/image.png?ex=665749cc&is=6655f84c&hm=bf88428190858cb2e1ea223a7a5b8ce962dfe2b07a88d46530123510b4112f95&)

Dari flowchart tersebut, routine yang digunakan dalam program dapat dikategorikan menjadi beberapa bagian, yaitu Main Program Routine, ADC Routine, I2C Routine, LCD Routine, ASCII Routine dan Delay Routine. Main Program routine merupakan representasi langsung dari flowchart yang telah dibuat. ADC Routine adalah sekumpulan routine dalam assembly yang berisi serangkaian instruksi yang dilakukan untuk menerima nilai sensor dari input analog. I2C Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk melakukan operasi pada I2C serial communication. LCD Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk melakukan operasi pada LCD. ASCII Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk mengubah nilai yang dibaca dari sensor analog menjadi nilai ASCIInya. Delay Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk membuat efek delay pada arduino.

### Implementasi Perangkat Lunak
Kode bahasa rakitan yang dibuat menghubungkan sensor MQ2 yang dihubungkan pada pin arduino melalui breadboard yang terhubung ke pin konverter analog digital (ADC) 0 yang kemudian kode tersebut akan membaca data analog yang masuk dari sensor dan akan memprosesnya menjadi data digital untuk mengirimkannya ke LCD (yang sebelumnya telah terhubung ke arduino menggunakan protokol I2C) yang kemudian akan menampilkan data mengenai kondisi tingkatan kandungan CO yang terdapat pada udara. Selain itu kode ini akan menampilkan tingkatan tersebut kedalam 3 LED yang akan menampilkan data tersebut berdasarkan tingkatan yang telah diatur batasnya. 3 LED ini akan merepresentasikan tingkatan aman (hijau), waspada (kuning), dan bahaya (merah). Kemudian terdapat pin pada arduino yang akan digunakan untuk mengaktifkan buzzer yang akan menandakan tanda bahaya (ketika lampu LED merah menyala) yang menunjukkan bahwa tingkatan kandungan CO pada udara sudah dalam tahapan yang berbahaya.

## Hasil Pengujian dan Evaluasi Kinerja
Present the results of your testing, including any performance metrics, and evaluate the system’s performance.

## Kesimpulan
Summarize the project outcomes and discuss potential improvements and future work.
