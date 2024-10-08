import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/main.dart'; // Cambia esta importación según tu estructura de proyecto

void main() {
  testWidgets('Formulario de tarjeta smoke test', (WidgetTester tester) async {
    // Construye el widget de la app y desencadena un frame.
    await tester.pumpWidget(MyApp());

    // Encuentra el campo de texto del vencimiento.
    var expiryDateField = find.byType(TextFormField).at(4);

    // Introduce un valor incorrecto y presiona el botón de enviar.
    await tester.enterText(expiryDateField, '13/23');
    await tester.tap(find.text('Enviar'));
    await tester.pump();

    // Verifica que el mensaje de error aparezca.
    expect(find.text('Ingresa una fecha válida (MM/AA)'), findsOneWidget);

    // Ahora introduce un valor correcto.
    await tester.enterText(expiryDateField, '12/23');
    await tester.tap(find.text('Enviar'));
    await tester.pump();

    // Verifica que el mensaje de error desaparezca.
    expect(find.text('Ingresa una fecha válida (MM/AA)'), findsNothing);
  });
}
