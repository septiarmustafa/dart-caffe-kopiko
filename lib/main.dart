import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

List<Kopi> menu = [
  Kopi(namaKopi: "Americano", harga: 20000, stok: 22, value: false),
  Kopi(namaKopi: "Cappucino", harga: 21000, stok: 13, value: false),
  Kopi(namaKopi: "Moccachino", harga: 24000, stok: 25, value: false),
  Kopi(namaKopi: "Caffe Latte", harga: 22000, stok: 20, value: false),
];

List multipleSelected = [];

List sumHarga = [];

var totalHarga = sumHarga.reduce(
  (a, b) => a + b,
);

class Kopi {
  String? namaKopi;
  int? harga;
  int? stok;
  bool? value;

  Kopi({this.namaKopi, this.harga, this.stok, this.value});
}

// var totalHarga = [1, 2, 3,].reduce((a, b) => a + b);
String dipilih = "";
int qty = 0;

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo App Code Caffee",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Code Caffee")),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    "Selamat datang",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Center(
                child: Text(
                  "Silakan Memilih Kopi Favorit Anda",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Text(
                  textAlign: TextAlign.start,
                  "Menu Code Caffee :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: menu.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            debugPrint(menu[index].namaKopi.toString());
                            debugPrint(menu[index].harga.toString());
                            debugPrint(menu[index].stok.toString());

                            setState(() {
                              menu[index].value = !menu[index].value!;

                              if (menu[index].value == true) {
                                multipleSelected.add(menu[index].namaKopi);
                                multipleSelected.add(menu[index].harga);
                                sumHarga.add(menu[index].harga);
                                totalHarga = sumHarga.reduce((a, b) => a + b);
                                print(totalHarga);

                                print(totalHarga);
                              } else {
                                multipleSelected.remove(menu[index].namaKopi);
                                multipleSelected.remove(menu[index].harga);
                                sumHarga.remove(menu[index].harga);

                                if (sumHarga.isNotEmpty) {
                                  sumHarga.add(menu[index].harga);
                                  totalHarga = sumHarga.reduce((a, b) => a + b);
                                  sumHarga.remove(menu[index].harga);
                                }

                                print(totalHarga);
                              }
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: menu[index].value == true
                                    ? Colors.blue
                                    : null,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(width: 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        menu[index].namaKopi!,
                                        style: TextStyle(
                                            color: menu[index].value == true
                                                ? Colors.white
                                                : null,
                                            fontWeight:
                                                menu[index].value == true
                                                    ? FontWeight.bold
                                                    : null),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        menu[index].stok.toString(),
                                        style: TextStyle(
                                            color: menu[index].value == true
                                                ? Colors.white
                                                : null,
                                            fontWeight:
                                                menu[index].value == true
                                                    ? FontWeight.bold
                                                    : null),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Rp. " + menu[index].harga.toString(),
                                    style: TextStyle(
                                        color: menu[index].value == true
                                            ? Colors.white
                                            : null,
                                        fontWeight: menu[index].value == true
                                            ? FontWeight.bold
                                            : null),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  children: [
                    const Text(
                      "Menu yang dipilih :",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: multipleSelected.length,
                              itemBuilder: (context, index) {
                                return Text(
                                  (multipleSelected[index].toString()),
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Total Harga",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          sumHarga.isNotEmpty == true
                              ? totalHarga.toString()
                              : "Rp. 0",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          sumHarga.isNotEmpty == true
                              ? showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10)),
                                    title: Text("Berhasil Membeli"),
                                    content: const Text(
                                        "Terima kasih telah membeli"),
                                    actions: [
                                      // ElevatedButton(
                                      //     onPressed: () {}, child: Text("OK")),
                                    ],
                                  ),
                                )
                              : showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                10)),
                                    title: Text("Anda belum memilih menu"),
                                    content: const Text(
                                        "Harap pilih menu terlebih dahulu"),
                                    actions: [
                                      // ElevatedButton(
                                      //     onPressed: () {}, child: Text("OK")),
                                    ],
                                  ),
                                );
                        },
                        child: Text("Beli")),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// child: ElevatedButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) => AlertDialog(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadiusDirectional.circular(10)),
//                     title: Text("Judul"),
//                     content: const Text(
//                         "Ini adalah deskripsi dialog, kamu bisa melihatnya disini"),
//                     actions: [
//                       ElevatedButton(onPressed: () {}, child: Text("OK")),
//                       ElevatedButton(onPressed: () {}, child: Text("CANCEL"))
//                     ],
//                   ),
//                 );
//               },
//               child: Text("KLIK")),
