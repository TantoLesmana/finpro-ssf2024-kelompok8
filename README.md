# Sistem Pemantauan Kualitas Udara dengan Peringatan Otomatis
Proyek Akhir Mata Kuliah Sistem Siber Fisik 2024 Kelompok 8

Kelompok 8:
- Farhan Nuzul Noufendri (2206024442)
- Ivander Andreas Wijaya (2206031896)
- Nicholas Samosir (2206059396)
- Tanto Efrem Lesmana (2206031391)

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
Untuk mengatasi masalah kualitas udara, sistem AIRSAFE menggunakan mikrokontroler Arduino atmega328p dan sensor gas MQ-2 sebagai solusi efektif pemantauan real-time. Sistem ini terdiri dari sebuah Arduino dimana Arduino mengolah data dari sensor yang mendeteksi gas berbahaya seperti karbon monoksida (CO) serta memberikan peringatan dalam bentuk buzzer dan LED.

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
- Kabel Jumper
- Breadboard (1)

### Implementasi Perangkat Keras

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245039422114893994/image.png?ex=66574cd1&is=6655fb51&hm=dc610270360d049bef32660a96f448c0d56fb1524eb6aad638adeba7c03ca921&)

Desain rangkaian kami dibuat dengan menggunakan aplikasi Proteus. Rangkaian dibuat sedemikian rupa dengan menggunakan sebuah arduino dengan mengimplementasikan modul I2C untuk menjalankan penampilan hasil pembacaan dan pendeteksian sensor terpisah dari peringatan LED dan buzzer. Buzzer dirangkai dengan konfigurasi sedemikian rupa agar dapat menyala. Setiap LED dilengkapi oleh resistor untuk membatasi tegangan yang lewat pada masing-masing LED.

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245041837056593990/image.png?ex=66574f11&is=6655fd91&hm=99ff15a915b1c4b9b9f92681d10ab36a47dcbab25c8c2941b4443f15a8826fa6&)

Rangkaian asli dibuat langsung ke dalam arduino asli dengan meng-flash kode .S ke arduino dan merangkai pada breadboard.

## Detail Implementasi Perangkat Lunak
### Desain Perangkat Lunak
Untuk mempermudah pembuatan dari alat tersebut, akan menguntungkan apabila dibuat sebuah flowchart untuk mengetahui alur dari kerja alat tersebut.

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245036177933864980/image.png?ex=665749cc&is=6655f84c&hm=bf88428190858cb2e1ea223a7a5b8ce962dfe2b07a88d46530123510b4112f95&)

Dari flowchart tersebut, routine yang digunakan dalam program dapat dikategorikan menjadi beberapa bagian, yaitu Main Program Routine, ADC Routine, I2C Routine, LCD Routine, ASCII Routine dan Delay Routine. Main Program routine merupakan representasi langsung dari flowchart yang telah dibuat. ADC Routine adalah sekumpulan routine dalam assembly yang berisi serangkaian instruksi yang dilakukan untuk menerima nilai sensor dari input analog.

I2C Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk melakukan operasi pada I2C serial communication. LCD Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk melakukan operasi pada LCD. ASCII Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk mengubah nilai yang dibaca dari sensor analog menjadi nilai ASCIInya. Delay Routine adalah sekumpulan routine yang berisi instruksi - instruksi untuk membuat efek delay pada arduino.

### Implementasi Perangkat Lunak
Kode bahasa rakitan yang dibuat menghubungkan sensor MQ2 yang dihubungkan pada pin arduino melalui breadboard yang terhubung ke pin konverter analog digital (ADC) 0 yang kemudian kode tersebut akan membaca data analog yang masuk dari sensor dan akan memprosesnya menjadi data digital untuk mengirimkannya ke LCD (yang sebelumnya telah terhubung ke arduino menggunakan protokol I2C) yang kemudian akan menampilkan data mengenai kondisi tingkatan kandungan CO yang terdapat pada udara.

Selain itu kode ini akan menampilkan tingkatan tersebut kedalam 3 LED yang akan menampilkan data tersebut berdasarkan tingkatan yang telah diatur batasnya. 3 LED ini akan merepresentasikan tingkatan aman (hijau), waspada (kuning), dan bahaya (merah). Kemudian terdapat pin pada arduino yang akan digunakan untuk mengaktifkan buzzer yang akan menandakan tanda bahaya (ketika lampu LED merah menyala) yang menunjukkan bahwa tingkatan kandungan CO pada udara sudah dalam tahapan yang berbahaya.

## Hasil Pengujian dan Evaluasi Kinerja
### Hasil Pengujian
Peringatan threshold pertama:

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245044529313353778/image.png?ex=66575193&is=66560013&hm=b6b458ec27e3cd9d81ad1073b77a02941a9d3440898507c7a94824be5124496a&)

Peringatan threshold kedua:

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245044610745765949/image.png?ex=665751a7&is=66560027&hm=e5a282cba480df1101631a862f490259d1877d385b95374b372e27faa6205381&)

Peringatan threshold ketiga:

![alt text](https://cdn.discordapp.com/attachments/402016959727665172/1245044754169729084/image.png?ex=665751c9&is=66560049&hm=b749ac33a0acac67c0d06cc7dfb3e000aaeef026355f61d5c1815f321ce2b6d5&)

### Evaluasi
Sistem tersebut mampu menunjukkan kadar CO dan memberikan aproksimasi tingkat CO yang terdapat pada udara disekitar dan menampilkannya pada LCD. Sistem ini dapat mengukur kadar CO dengan cukup akurat dan memberikan peringatan melalui buzzer jika kadar CO sudah dalam tahap berbahaya. Sistem ini juga mudah sekali digunakan karena tidak perlu interaksi dari pengguna dan mampu menampilkan status kadar CO ke 3 LED untuk memudahkan memantau tingkatan CO dalam udara. Sistem ini juga menggunakan sistem Arduino Uno berbasis ATMega 328p sehingga efisien dalam penggunaan daya, andal, dan mudah untuk diperbaiki.


## Kesimpulan
Berdasarkan serangkaian pengujian yang telah dilakukan, sistem ini berjalan dengan cukup baik pada rangkaian proteus dan rangkaian nyata. Sensor MQ2 yang digunakan dalam sistem ini mampu mendeteksi variasi kadar CO di udara. Protokol I2C yang digunakan untuk menghubungkan Arduino dengan LCD berfungsi dalam menampilan data CO secara real-time dan memberikan informasi yang jelas. Sistem indikator yang terdiri dari tiga LED (hijau, kuning, merah) berfungsi dengan baik dalam memberikan indikasi visual terhadap tingkat bahaya CO dengan ketentuan yang formatnya masih dalam ppm di mana LED hijau menyala pada kadar CO 0-141 ppm, LED kuning pada 141-216 ppm, dan LED merah menyala serta buzzer berbunyi ketika kadar CO melebihi 216 ppm.

Secara keseluruhan, sistem ini berhasil mengintegrasikan berbagai komponen untuk menciptakan alat deteksi CO sehingga dapat diimplementasikan dalam peningkatan kesehatan dengan memberikan peringatan dini terhadap paparan gas CO yang berbahaya.
