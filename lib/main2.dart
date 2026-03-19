import 'package:flutter/material.dart';

// Puedes probar esta pantalla de forma independiente corriendo este main
void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: PagoEntregaScreen()));

class PagoEntregaScreen extends StatelessWidget {
  const PagoEntregaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // El requerimiento pide que la imagen ocupe 1/3 del ancho de la pantalla
    final double anchoImagen = MediaQuery.of(context).size.width / 3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // ---------------------------------------------------------
              // FILA 1: Logo, texto "MySelfCar" a la izquierda y menú hamburguesa a la derecha
              // ---------------------------------------------------------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.directions_car, color: Colors.purple[800], size: 28),
                      const SizedBox(width: 8),
                      Text(
                        "MySelfCar",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.purple[900]),
                      ),
                    ],
                  ),
                  const Icon(Icons.menu, size: 30, color: Colors.black87),
                ],
              ),
              const SizedBox(height: 25),

              // ---------------------------------------------------------
              // FILA 2: Flecha regresar y texto "PAGO Y ENTREGA" centrado
              // ---------------------------------------------------------
              Row(
                children: [
                  const Icon(Icons.arrow_back, color: Colors.black87),
                  Expanded(
                    child: Center(
                      child: Text(
                        "PAGO Y ENTREGA",
                        style: TextStyle(
                          fontSize: 18, 
                          fontWeight: FontWeight.w900, 
                          color: Colors.purple[900], 
                          letterSpacing: 1.2
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24), // Espaciador para equilibrar la flecha y que el texto quede al centro perfecto
                ],
              ),
              const SizedBox(height: 30),

              // ---------------------------------------------------------
              // FILA 3: Imagen centrada horizontalmente (1/3 de la pantalla)
              // ---------------------------------------------------------
              Container(
                width: anchoImagen,
                height: anchoImagen, // La hacemos cuadrada para que se vea estética
                decoration: BoxDecoration(
                  color: Colors.purple.shade50,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.purple.shade300, width: 2),
                  image: const DecorationImage(
                    // Imagen representativa de entrega/ubicación de refacciones
                    image: NetworkImage("https://images.unsplash.com/photo-1555626906-fcf10d6851b4?q=80&w=300&auto=format&fit=crop"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(color: Colors.purpleAccent.withAlpha(80), blurRadius: 15, spreadRadius: 2)
                  ],
                ),
              ),
              const SizedBox(height: 15),

              // ---------------------------------------------------------
              // FILA 4: Botón "Elegir Ubicación" (ligeramente más pequeño que la imagen)
              // ---------------------------------------------------------
              SizedBox(
                width: anchoImagen * 0.9, 
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDCD0FF), // Lila
                    foregroundColor: Colors.purple[900],
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Colors.purple.shade300)
                    ),
                  ),
                  onPressed: () {},
                  child: const Text("Elegir Ubicación", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                ),
              ),
              
              // Espacio considerable como lo indica el requerimiento
              const SizedBox(height: 40),

              // ---------------------------------------------------------
              // FILA 5: Input Tarjeta (Cuadro de ícono a la izq, input a la der)
              // ---------------------------------------------------------
              _construirInputEstructurado(Icons.credit_card),
              const SizedBox(height: 15),

              // ---------------------------------------------------------
              // FILA 6: Dos columnas (Calendario y Candado)
              // ---------------------------------------------------------
              Row(
                children: [
                  Expanded(child: _construirInputEstructurado(Icons.calendar_today)),
                  const SizedBox(width: 15), // Pequeño espacio entre ambas
                  Expanded(child: _construirInputEstructurado(Icons.lock_outline)),
                ],
              ),
              const SizedBox(height: 15),

              // ---------------------------------------------------------
              // FILA 7: Input Usuario/Persona
              // ---------------------------------------------------------
              _construirInputEstructurado(Icons.person_outline),
              
              const SizedBox(height: 40),

              // ---------------------------------------------------------
              // FILA 8: Botón verde alineado a la derecha con flecha
              // ---------------------------------------------------------
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00E676), // Verde brillante y vibrante
                    foregroundColor: Colors.black87,
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 4,
                  ),
                  onPressed: () {},
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Siguiente", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Método que crea exactamente la estructura de Input solicitada:
  // "dividido en 2 columnas: un cuadro pequeño con el ícono a la izquierda, y el espacio sin placeholder a la derecha"
  Widget _construirInputEstructurado(IconData icono) {
    return Container(
      height: 50, // Altura uniforme para todos
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.purple.shade200, width: 1.5),
      ),
      child: Row(
        children: [
          // Cuadro izquierdo con el ícono (Fondo morado claro como pide el prompt)
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFF3E5F5), // Lila súper claro
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(6), bottomLeft: Radius.circular(6)),
              border: Border(right: BorderSide(color: Colors.purple.shade200, width: 1.5)),
            ),
            child: Icon(icono, color: Colors.purple[800], size: 24),
          ),
          // Área de texto a la derecha (Sin placeholder)
          const Expanded(
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}