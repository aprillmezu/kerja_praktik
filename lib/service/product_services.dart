import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';

class ProductService {
  final CollectionReference _productRef =
  FirebaseFirestore.instance.collection('products');

  // Tambah produk
  Future<void> addProduct(Product product) async {
    try {
      await _productRef.add(product.toMap());
    } catch (e) {
      print("Error saat menambahkan produk: $e");
    }
  }

  // Update produk
  Future<void> updateProduct(Product product) async {
    try {
      await _productRef.doc(product.id).update(product.toMap());
    } catch (e) {
      print("Error saat mengupdate produk: $e");
    }
  }

  // Hapus produk
  Future<void> deleteProduct(String id) async {
    try {
      await _productRef.doc(id).delete();
    } catch (e) {
      print("Error saat menghapus produk: $e");
    }
  }

  // Ambil semua produk (real-time stream)
  Stream<List<Product>> getProducts() {
    return _productRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }

  // Ambil satu produk berdasarkan ID
  Future<Product?> getProductById(String id) async {
    try {
      DocumentSnapshot doc = await _productRef.doc(id).get();
      if (doc.exists) {
        return Product.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }
    } catch (e) {
      print("Error saat mengambil produk: $e");
    }
    return null;
  }
}
