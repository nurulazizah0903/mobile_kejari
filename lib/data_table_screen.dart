import 'package:flutter/material.dart';
import 'api_service.dart';

class DataTableScreen extends StatefulWidget {
  @override
  _DataTableScreenState createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  final ApiService _apiService = ApiService();
  late Future<List<dynamic>> _data;

  @override
  void initState() {
    super.initState();
    _data = _apiService.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kejaksaan Tinggi Negeri Flores')),
      body: FutureBuilder<List<dynamic>>(
        future: _data,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No data available'));
          } else {
            return DataTable(
              columns: [
                DataColumn(label: Text('Pemberi Kuasa')),
                DataColumn(label: Text('Nama Pegawai')),
                DataColumn(label: Text('Peraturan')),
                DataColumn(label: Text('Nomor Surat')),
                DataColumn(label: Text('Tanggal Surat')),
                DataColumn(label: Text('Kendaraan')),
                DataColumn(label: Text('Instansi')),
              ],
              rows: snapshot.data!.map((data) {
                return DataRow(
                  cells: [
                    DataCell(Text(data['id_kuasa'])),
                    DataCell(Text(data['id_pegawai'])),
                    DataCell(Text(data['id_peraturan'])),
                    DataCell(Text(data['nomor_surat'])),
                    DataCell(Text(data['tgl_surat'])),
                    DataCell(Text(data['id_kendaraan'])),
                    DataCell(Text(data['id_instansi'])),
                  ],
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
