import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

List<Data> data1 = [
  Data(
      gambar: 'https://picsum.photos/200',
      nama: 'Securinvest Sharia Sukuk Fund',
      skor: '4.1',
      jenis: 'Pendapatan Tetap',
      imbalHasil: '6.2%',
      imbalHasilTahun: '12.4%',
      hargaUnit: 'Rp. 1.080',
      danaKelolaan: 'Rp. 3.3T'),
  Data(
      gambar: 'https://picsum.photos/200',
      nama: 'Start Stable Income Fund',
      skor: '3.2',
      jenis: 'Pendapatan Tetap',
      imbalHasil: '12%',
      imbalHasilTahun: '24%',
      hargaUnit: 'Rp. 1.070',
      danaKelolaan: 'Rp. 256M'),
];

class MyAppState extends State<MyApp> {
  String waktu = "6 bulan";
  String _waktuOut = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hello App',
      home: Scaffold(
        appBar: AppBar(
            leading: FlutterLogo(),
            backgroundColor: Colors.blueGrey,
            title: Text('Quiz Flutter'),
            actions: <Widget>[ButtonNamaKelompok(), ButtonPerjanjian()]),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              DropdownButton(
                value: waktu,
                underline: Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.0, color: Colors.grey))),
                ),
                items: const [
                  DropdownMenuItem(
                    value: "6 bulan",
                    child: Text("6 bulan"),
                  ),
                  DropdownMenuItem(
                    value: "1 tahun",
                    child: Text("1 tahun"),
                  ),
                ],
                onChanged: (String? newValue) {
                  setState(() {
                    if (newValue != null) {
                      waktu = newValue;
                    }
                  });
                },
              ),
            ]),
            Expanded(
              child: Container(
                child: ListView.builder(
                    itemCount: data1.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          onTap: () {},
                          leading: Image.network(data1[index].gambar),
                          trailing: Image.network(
                            data1[index].gambar,
                            height: 35,
                          ),
                          title: Column(
                            children: [
                              Text(data1[index].nama),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.star),
                                  Text(data1[index].skor),
                                  Text(' - '),
                                  Text(data1[index].jenis),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(14),
                                      child: Column(
                                        children: [
                                          Text("Imbal Hasil"),
                                          Text(
                                            waktu == '6 bulan'
                                                ? (data1[index].imbalHasil)
                                                : (data1[index]
                                                    .imbalHasilTahun),
                                          )
                                        ],
                                      )),
                                  Container(
                                      child: Column(
                                    children: [
                                      Text("Harga Unit"),
                                      Text(data1[index].hargaUnit),
                                    ],
                                  )),
                                  Container(
                                      child: Column(
                                    children: [
                                      Text("Dana Kelolaan"),
                                      Text(data1[index].danaKelolaan),
                                    ],
                                  )),
                                ],
                              ),
                            ],
                          ),
                          shape: RoundedRectangleBorder(
                              side: BorderSide(width: 1)),
                        ),
                      );
                    }),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class ButtonNamaKelompok extends StatelessWidget {
  const ButtonNamaKelompok({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.account_circle_rounded),
      onPressed: () {
        // icon account di tap
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Kelompok 5'),
            content: const Text(
                'Indah Resti Fauzi(indahrestifauzi@upi.edu) ; Amida Zulfa Laila (amida.zulfa@upi.edu)'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class ButtonPerjanjian extends StatelessWidget {
  const ButtonPerjanjian({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.access_alarm_rounded),
      onPressed: () {
        // icon setting ditap
        const snackBar = SnackBar(
          duration: Duration(seconds: 20),
          content: Text(
              'Kami berjanji  tidak akan berbuat curang dan atau membantu kelompok lain berbuat curang'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }
}

class Data {
  String gambar = "";

  String nama = "";

  String skor = "";

  String jenis = "";

  String imbalHasil = "";
  String imbalHasilTahun = "";

  String hargaUnit = "";

  String danaKelolaan = "";

  Data({
    required this.gambar,
    required this.nama,
    required this.skor,
    required this.jenis,
    required this.imbalHasil,
    required this.imbalHasilTahun,
    required this.hargaUnit,
    required this.danaKelolaan,
  });
}
