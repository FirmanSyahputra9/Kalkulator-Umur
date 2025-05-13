import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KalkulatorUmur extends StatefulWidget {
  const KalkulatorUmur({super.key});

  @override
  KalkulatorUmurState createState() => KalkulatorUmurState();
}

class KalkulatorUmurState extends State<KalkulatorUmur> {
  DateTime? _tanggalLahir;
  String? _umurDetail;
  int? _hariTersisaUlangTahun;

  void _pilihTanggal(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('en', 'US'),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.blue[700]!,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      setState(() {
        _tanggalLahir = pickedDate;
        _hitungUmur();
        _hitungHariTersisaUlangTahun();
      });
    }
  }

  void _hitungUmur() {
    if (_tanggalLahir != null) {
      DateTime sekarang = DateTime.now();
      int tahun = sekarang.year - _tanggalLahir!.year;
      int bulan = sekarang.month - _tanggalLahir!.month;
      int hari = sekarang.day - _tanggalLahir!.day;

      if (hari < 0) {
        bulan -= 1;
        hari += DateTime(sekarang.year, sekarang.month, 0).day;
      }

      if (bulan < 0) {
        tahun -= 1;
        bulan += 12;
      }

      setState(() {
        _umurDetail = '$tahun tahun, $bulan bulan, $hari hari';
      });
    }
  }

  void _hitungHariTersisaUlangTahun() {
    if (_tanggalLahir != null) {
      DateTime sekarang = DateTime.now();
      DateTime ulangTahunBerikutnya =
          DateTime(sekarang.year, _tanggalLahir!.month, _tanggalLahir!.day);

      if (ulangTahunBerikutnya.isBefore(sekarang) ||
          ulangTahunBerikutnya.isAtSameMomentAs(sekarang)) {
        ulangTahunBerikutnya = DateTime(
            sekarang.year + 1, _tanggalLahir!.month, _tanggalLahir!.day);
      }

      int hariTersisa = ulangTahunBerikutnya.difference(sekarang).inDays;

      setState(() {
        _hariTersisaUlangTahun = hariTersisa;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[100]!, Colors.blue[50]!],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      '🎂 Cek Umurmu',
                      style: TextStyle(
                        fontFamily: 'Caveat',
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () => _pilihTanggal(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[700],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today),
                          SizedBox(width: 8),
                          Text(
                            'Pilih Tanggal Lahir',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (_tanggalLahir != null)
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.cake, color: Colors.blue),
                          const SizedBox(width: 8),
                          Text(
                            'Tanggal Lahir: ${DateFormat('dd/MM/yyyy').format(_tanggalLahir!)}',
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      if (_umurDetail != null) ...[
                        const Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.access_time, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text(
                              'Umur Anda: $_umurDetail',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                      if (_hariTersisaUlangTahun != null) ...[
                        const Divider(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.celebration, color: Colors.blue),
                            const SizedBox(width: 8),
                            Text(
                              'Ulang tahunmu $_hariTersisaUlangTahun hari lagi',
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
