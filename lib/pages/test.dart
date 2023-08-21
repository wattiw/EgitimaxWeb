import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Kayıt İşlemleri Menüsü'),
        ),
        body: Center(
          child: DropdownButton<String>(
            hint: const Text('İşlem Seçin'),
            items: <String>['Kayıt Ekle', 'Kayıt Sil', 'Kayıt Güncelle'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Row(
                  children: [
                    if (value == 'Kayıt Ekle') const Icon(Icons.add),
                    if (value == 'Kayıt Sil') const Icon(Icons.delete),
                    if (value == 'Kayıt Güncelle') const Icon(Icons.edit),
                    const SizedBox(width: 8), // Simgeden biraz boşluk
                    Text(value),
                  ],
                ),
              );
            }).toList(),
            onChanged: (String? selectedValue) {
              // Seçilen işleme göre ilgili işlevi burada çağırabilirsiniz
              if (selectedValue == 'Kayıt Ekle') {
                // Kayıt Ekleme İşlemi
              } else if (selectedValue == 'Kayıt Sil') {
                // Kayıt Silme İşlemi
              } else if (selectedValue == 'Kayıt Güncelle') {
                // Kayıt Güncelleme İşlemi
              }
            },
          ),
        ),
      ),
    );
  }
}
