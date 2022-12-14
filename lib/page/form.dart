import 'package:flutter/material.dart';
import 'package:counter_7/model/budget.dart';
import 'package:counter_7/utils/drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _judul = "";
  int _nominal = 0;
  String? _jenis;
  DateTime? _date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Budget'),
      ),
      drawer: const NavigationDrawer(),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                // Input Judul
                // Menggunakan padding sebesar 8 pixels
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: Beli Makan",
                    labelText: "Judul",
                    // Menambahkan icon agar lebih intuitif
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  // Menambahkan behavior saat nama diketik
                  onChanged: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      _judul = value!;
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama lengkap tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Input Nominal
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Contoh: 20000",
                    labelText: "Nominal",
                    // Menambahkan circular border agar lebih rapi
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  keyboardType: TextInputType.number,
                  // Menambahkan behavior saat nominal diketik
                  onChanged: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Menambahkan behavior saat data disimpan
                  onSaved: (String? value) {
                    setState(() {
                      if (value == null || value.isEmpty) {
                        _nominal = 0;
                      } else {
                        _nominal = int.parse(value);
                      }
                    });
                  },
                  // Validator sebagai validasi form
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nominal tidak boleh kosong!';
                    }
                    if (int.parse(value) == 0) {
                      return 'Nominal tidak boleh nol!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                // Input Jenis
                padding: const EdgeInsets.all(8.0),
                child: DropdownButton(
                  value: _jenis,
                  hint: const Text("Pilih Jenis"),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: const <DropdownMenuItem<String>>[
                    DropdownMenuItem<String>(
                      value: 'Pengeluaran',
                      child: Text('Pengeluaran'),
                    ),
                    DropdownMenuItem<String>(
                      value: 'Pemasukan',
                      child: Text('Pemasukan'),
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      _jenis = value ?? "";
                    });
                  },
                ),
              ),
              Padding(
                // Input Date
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 4.0),
                    TextButton(
                      onPressed: (() {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2999),
                        ).then((value) {
                          setState(() {
                            _date = value;
                          });
                        });
                      }),
                      child: Text(
                        _date.toString().split(' ')[0],
                        style: const TextStyle(
                          fontSize: 16.0,
                          // color: Colors.black87,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Budget.addBudget(
                        judul: _judul,
                        nominal: _nominal,
                        jenis: _jenis,
                        date: _date,
                      );
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            elevation: 15,
                            child: ListView(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 16.0,
                              ),
                              shrinkWrap: true,
                              children: [
                                Center(
                                  child: Text(
                                    "Berhasil menambahkan $_jenis $_judul sebesar ${_nominal.toString()}",
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Kembali'),
                                )
                              ],
                            ),
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
                  style: ButtonStyle(
                    padding:
                        MaterialStateProperty.all(const EdgeInsets.all(12.0)),
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
