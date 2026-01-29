import 'package:flutter/material.dart';
import '../models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFEDE7F6), Color(0xFFF3E5F5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ FIXED IMAGE
              Container(
                height: 300,
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Image.network(
                  product.image,
                  fit: BoxFit.contain, // 👈 IMPORTANT FIX
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                      '₹${product.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      product.description,
                      style:
                          const TextStyle(fontSize: 16, height: 1.5),
                    ),
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
