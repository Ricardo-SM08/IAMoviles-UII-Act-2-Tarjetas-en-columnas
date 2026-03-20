import 'package:flutter/material.dart';
// Descomenta estas líneas cuando crees los archivos:
// import 'detalles_producto_screen.dart';
// import 'carrito_screen.dart';

void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MySelfCar',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.purple,
      ),
      // Mantenemos las rutas nombradas intactas
      initialRoute: '/',
      routes: {
        '/': (context) => const PantallaInicio(),

      },
    );
  }
}

// Convertimos PantallaInicio en StatefulWidget para manejar el nuevo diseño dinámico
class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  final List<Map<String, String>> listaAutos = [
    {
      "titulo": "Ford Mustang GT",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/mustang.jpg",
      "desc": "Motor V8, 450 HP. El clásico americano. Cuenta con interiores de piel, sistema de infoentretenimiento de última generación y un escape con sonido ajustable. Ideal para quienes buscan adrenalina y estilo.",
      "spec": "Año: 2024"
    },
    {
      "titulo": "Charger Dodge",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/charger.jpg",
      "desc": "Diseño aerodinámico y gran potencia. Un muscle car de 4 puertas que no sacrifica comodidad por velocidad.",
      "spec": "Año: 2023"
    },
    {
      "titulo": "Nissan GT-R",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/r35.jpg",
      "desc": "El superdeportivo japonés por excelencia. Conocido como 'Godzilla', ofrece tracción integral inteligente.",
      "spec": "Año: 2024"
    },
    {
      "titulo": "Nissan Gt R33",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/download.jpg",
      "desc": "Compacto deportivo y versátil. Una leyenda de los años 90 altamente cotizado.",
      "spec": "Año: 1985"
    },
  ];

  final List<Map<String, String>> listaPiezas = [
    {
      "titulo": "Aceite para Motor",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/aceite_carro.jpg",
      "desc": "Aceite sintético de alta durabilidad que protege tu motor contra el desgaste extremo.",
      "spec": "Sintético 5W-30"
    },
    {
      "titulo": "Filtro Aceite",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/filtro.jpg",
      "desc": "Filtro de alto flujo que asegura una limpieza profunda del aceite de tu motor.",
      "spec": "Universal"
    },
    {
      "titulo": "Rines",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/rines.jpg",
      "desc": "Juego de rines de aleación ligera. Mejoran la estética de tu vehículo.",
      "spec": "Aleación 18 pulgadas"
    },
    {
      "titulo": "Motor v8",
      "url": "https://raw.githubusercontent.com/Ricardo-SM08/imagenes-para-flutter-6-J-11-febrero-2026/refs/heads/main/motor_v8.jpg",
      "desc": "Bloque de motor V8 reconstruido. Listo para ser instalado.",
      "spec": "5.0 Litros"
    },
  ];

  int _cantidadAutosVisibles = 2;

  void _cargarMasAutos() {
    setState(() {
      if (_cantidadAutosVisibles < listaAutos.length) {
        _cantidadAutosVisibles += 2;
        if (_cantidadAutosVisibles > listaAutos.length) {
          _cantidadAutosVisibles = listaAutos.length;
        }
      }
    });
  }

  void _alTocarIconoNavegacion(int index) {
    if (index == 1) {
      // Mostrar aviso si aún no existe la pantalla
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Pantalla de Carrito en construcción')),
      );
      // Cuando tengas el archivo, descomenta esto:
      /*
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const CarritoScreen()),
      );
      */
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFFDCD0FF),
        elevation: 0,
        // El icono de menú del Drawer se pone automáticamente aquí a la izquierda
        title: const Text(
          'MySelfCar',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Cursive',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      // Integramos el Drawer que ya teníamos con las rutas nombradas
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              height: 220, 
              width: double.infinity,
              padding: const EdgeInsets.only(top: 40, left: 16, bottom: 10),
              decoration: BoxDecoration(
                color: Colors.purple.shade400,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircleAvatar(
                    radius: 28, 
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage('https://cdn-icons-png.flaticon.com/512/3204/3204003.png'), 
                  ),
                  SizedBox(height: 8),
                  Text('MySelfCar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  Text('Dir: Blvd. Zaragoza 456', style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text('Tel: 656-987-6543', style: TextStyle(color: Colors.white, fontSize: 12)),
                  Text('Email: selt@cars.com', style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.deepPurple),
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.directions_car, color: Colors.deepPurple),
              title: const Text('Carros'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/carros');
              },
            ),
            ListTile(
              leading: const Icon(Icons.build, color: Colors.deepPurple),
              title: const Text('Refacciones'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/refacciones');
              },
            ),
            ListTile(
              leading: const Icon(Icons.oil_barrel, color: Colors.deepPurple),
              title: const Text('Insumos y Aceites'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/insumos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.people, color: Colors.deepPurple),
              title: const Text('Clientes'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/clientes');
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory_2, color: Colors.deepPurple),
              title: const Text('Productos'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/productos');
              },
            ),
            ListTile(
              leading: const Icon(Icons.badge, color: Colors.deepPurple),
              title: const Text('Empleados'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/empleados');
              },
            ),
          ],
        ),
      ),
      // Aquí comienza tu nuevo diseño del cuerpo
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Buscar auto o pieza...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text("Nuestros Autos", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _cantidadAutosVisibles,
                itemBuilder: (context, index) {
                  final auto = listaAutos[index];
                  return GestureDetector(
                    onTap: () {
                      // Aviso temporal
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Detalles en construcción')),
                      );
                      // Descomenta cuando tengas detalles_producto_screen.dart
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallesProductoScreen(producto: auto, esAuto: true),
                        ),
                      );
                      */
                    },
                    child: ProductoCard(
                      titulo: auto["titulo"]!,
                      imagenUrl: auto["url"]!,
                      descripcion: auto["desc"]!,
                      especificacion: auto["spec"]!,
                    ),
                  );
                },
              ),
              if (_cantidadAutosVisibles < listaAutos.length)
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: ElevatedButton(
                      onPressed: _cargarMasAutos,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      ),
                      child: const Text("Más..."),
                    ),
                  ),
                ),
              const SizedBox(height: 10),
              const Divider(color: Colors.black54, thickness: 1.5),
              const SizedBox(height: 20),
              const Text("Refacciones", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.60,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: listaPiezas.length,
                itemBuilder: (context, index) {
                  final pieza = listaPiezas[index];
                  return GestureDetector(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Detalles en construcción')),
                      );
                      // Descomenta cuando tengas detalles_producto_screen.dart
                      /*
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetallesProductoScreen(producto: pieza, esAuto: false),
                        ),
                      );
                      */
                    },
                    child: ProductoCard(
                      titulo: pieza["titulo"]!,
                      imagenUrl: pieza["url"]!,
                      descripcion: pieza["desc"]!,
                      especificacion: pieza["spec"]!,
                    ),
                  );
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFFDCD0FF),
        selectedItemColor: Colors.purple[800],
        unselectedItemColor: Colors.black54,
        currentIndex: 0, 
        onTap: _alTocarIconoNavegacion,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Casa'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Carrito'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        ],
      ),
    );
  }
}

// Widget de Tarjeta de Producto que proporcionaste
class ProductoCard extends StatelessWidget {
  final String titulo;
  final String imagenUrl;
  final String descripcion;
  final String especificacion;

  const ProductoCard({
    super.key,
    required this.titulo,
    required this.imagenUrl,
    required this.descripcion,
    required this.especificacion,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imagenUrl),
                  fit: BoxFit.cover,
                  onError: (exception, stackTrace) {},
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    titulo,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Icon(Icons.circle, size: 6, color: Colors.purple[400]),
                      const SizedBox(width: 4),
                      Text(especificacion, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    descripcion,
                    style: TextStyle(fontSize: 11, color: Colors.grey[600]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}