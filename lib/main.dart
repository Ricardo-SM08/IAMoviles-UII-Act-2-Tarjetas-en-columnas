import 'package:flutter/material.dart';

void main() => runApp(const AppPrincipiante());

// 1. Clase Producto
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl;

  Producto({required this.titulo, required this.subtitulo, required this.imgUrl});
}

class AppPrincipiante extends StatelessWidget {
  const AppPrincipiante({super.key});

  @override
  Widget build(BuildContext context) {
    // 2. Lista de diccionarios por cada tarjeta (Con URLs 100% seguras)
    final List<Map<String, String>> datosTarjetas = [
      {
        "titulo": "Filtro de Aceite",
        "subtitulo": "Alta durabilidad y rendimiento",
        "imgUrl": "https://picsum.photos/id/111/200/200", // Imagen segura
      },
      {
        "titulo": "Llantas Deportivas",
        "subtitulo": "Agarre extremo en asfalto",
        "imgUrl": "https://picsum.photos/id/133/200/200", // Imagen segura
      },
      {
        "titulo": "Aceite Sintético",
        "subtitulo": "Protección total para motor",
        "imgUrl": "https://picsum.photos/id/183/200/200", // Imagen segura
      }
    ];

    // Convertir diccionarios a objetos de la clase Producto
    final List<Producto> productos = datosTarjetas.map((dato) {
      return Producto(
        titulo: dato["titulo"]!,
        subtitulo: dato["subtitulo"]!,
        imgUrl: dato["imgUrl"]!,
      );
    }).toList();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple.shade50, // Color pastel
        appBar: AppBar(
          title: const Text('Ejemplo Principiante'),
          backgroundColor: Colors.purple.shade200,
        ),
        // SOLUCIÓN 1: Envolver en SingleChildScrollView para evitar Overflow vertical
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            // 3. Columna principal con 3 filas
            child: Column(
              children: productos.map((producto) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15.0),
                  child: Card(
                    elevation: 5, // Sombreado
                    shadowColor: Colors.purple.shade200,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    color: Colors.purple.shade100, // Color pastel
                    child: Row(
                      children: [
                        // Imagen a la izquierda
                        ClipRRect(
                          borderRadius: const BorderRadius.only(topLeft: Radius.circular(15), bottomLeft: Radius.circular(15)),
                          child: Image.network(
                            producto.imgUrl, 
                            width: 100, 
                            height: 100, 
                            fit: BoxFit.cover,
                            // SOLUCIÓN 2: Evitar que falle la app si la imagen no carga
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                width: 100,
                                height: 100,
                                color: Colors.purple.shade300,
                                child: const Icon(Icons.image_not_supported, color: Colors.white),
                              );
                            },
                          ),
                        ),
                        const SizedBox(width: 15),
                        // Columna a la derecha con 2 filas (Textos)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                producto.titulo, 
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple),
                                maxLines: 1, // Evita Overflow horizontal
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                producto.subtitulo, 
                                style: TextStyle(fontSize: 14, color: Colors.purple.shade800),
                                maxLines: 2, // Evita Overflow horizontal
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}