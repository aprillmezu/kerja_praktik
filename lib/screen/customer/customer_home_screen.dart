import 'package:flutter/material.dart';
import '../../model/product_model.dart';
import '../../models/product_model.dart';
import '../../service/product_service.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({Key? key}) : super(key: key);

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  final ProductService _productService = ProductService();
  late Future<List<ProductModel>> _futureProducts;

  @override
  void initState() {
    super.initState();
    _futureProducts = _productService.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Produk Tersedia')),
      body: FutureBuilder<List<ProductModel>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return const Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Terjadi kesalahan: ${snapshot.error}'));

          final products = snapshot.data!;
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final p = products[index];
              return Card(
                child: ListTile(
                  leading: Image.network(p.imageUrl, width: 60, errorBuilder: (_, __, ___) => const Icon(Icons.image)),
                  title: Text(p.name),
                  subtitle: Text(p.type == ProductType.jual
                      ? 'Rp ${p.price}'
                      : 'Sewa: Rp ${p.rentalPrice}/hari'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
// TODO Implement this library.