import 'package:flutter/material.dart';
import 'models/urun_model.dart';
import 'screens/kesfet_ekrani.dart';
import 'screens/urun_detay_ekrani.dart';
import 'screens/sepet_ekrani.dart';

void main() {
  runApp(const MiniKatalogApp());
}

class MiniKatalogApp extends StatefulWidget {
  const MiniKatalogApp({super.key});

  @override
  State<MiniKatalogApp> createState() => _MiniKatalogAppState();
}

class _MiniKatalogAppState extends State<MiniKatalogApp> {
  final List<Urun> _sepet = [];

  void _sepeteEkle(Urun urun) {
    setState(() {
      _sepet.add(urun);
    });
  }

  void _sepettenCikar(Urun urun) {
    setState(() {
      _sepet.remove(urun);
    });
  }

  void _sepetiTemizle() {
    setState(() {
      _sepet.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Kahve Kataloğu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6F4E37),
          surface: const Color(0xFFF7F2EA),
        ),
        fontFamily: 'Roboto',
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => KesfetEkrani(
              sepet: _sepet,
              sepeteEkle: _sepeteEkle,
              sepettenCikar: _sepettenCikar,
            ),
        '/detay': (context) => UrunDetayEkrani(
              sepeteEkle: _sepeteEkle,
            ),
        '/sepet': (context) => SepetEkrani(
              sepet: _sepet,
              sepettenCikar: _sepettenCikar,
              sepetiTemizle: _sepetiTemizle,
            ),
      },
    );
  }
}