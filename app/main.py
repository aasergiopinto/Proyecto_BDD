from db import (
    init_connection_pool, 
    close_connection_pool,
    execute_query,
    execute_update,
    call_procedure
)

def mostrar_menu():
    """Muestra el menú principal"""
    print("\n" + "="*50)
    print("   SISTEMA DE GESTIÓN - PROYECTO BDD")
    print("="*50)
    print("1. Ver todos los clientes")
    print("2. Ver acciones comerciales")
    print("3. Ver resultados")
    print("4. Generar nuevo resultado (SP)")
    print("5. Buscar cliente por RUT")
    print("6. Insertar nuevo cliente")
    print("7. Ver segmentos")
    print("8. Ver productos bancarios")
    print("9. Salir")
    print("="*50)

def ver_clientes():
    """Muestra todos los clientes"""
    clientes = execute_query("SELECT * FROM cliente LIMIT 10")
    print("\n CLIENTES:")
    for c in clientes:
        print(f"  RUT: {c[0]} | Nombre: {c[1]} {c[4]} {c[5]}")

def ver_acciones():
    """Muestra acciones comerciales"""
    acciones = execute_query("SELECT * FROM accion_comercial")
    print("\nACCIONES COMERCIALES:")
    for a in acciones:
        print(f"  ID: {a[0]} | {a[1]} | Presupuesto: ${a[3]}")

def ver_resultados():
    """Muestra resultados"""
    resultados = execute_query("SELECT * FROM resultado")
    print("\nRESULTADOS:")
    for r in resultados:
        print(f"  ID: {r[0]} | Título: {r[1]} | Rentabilidad: ${r[3]}")

def generar_resultado():
    """Llama al SP para generar resultado"""
    id_accion = input("Ingresa ID de acción comercial: ")
    try:
        call_procedure('generar_resultado', [int(id_accion)])
        print("Resultado generado exitosamente")
    except Exception as e:
        print(f" Error: {e}")

def buscar_cliente():
    """Busca cliente por RUT"""
    rut = input("Ingresa RUT del cliente: ")
    cliente = execute_query("SELECT * FROM cliente WHERE rut = %s", (rut,))
    if cliente:
        c = cliente[0]
        print(f"\n Cliente encontrado:")
        print(f"  RUT: {c[0]}")
        print(f"  Nombre: {c[1]} {c[4]} {c[5]}")
        print(f"  Ingresos: ${c[3]}")
    else:
        print("Cliente no encontrado")

def insertar_cliente():
    """Inserta un nuevo cliente"""
    print("\nNUEVO CLIENTE:")
    rut = input("RUT: ")
    nombre = input("Nombre: ")
    apellido_p = input("Apellido paterno: ")
    apellido_m = input("Apellido materno: ")
    fecha_nac = input("Fecha nacimiento (YYYY-MM-DD): ")
    ingresos = input("Ingresos mensuales: ")
    
    try:
        execute_update(
            """INSERT INTO cliente (rut, nombre_cliente, fecha_nacimiento, 
               ingresos_mensuales, apellido_paterno, apellido_materno) 
               VALUES (%s, %s, %s, %s, %s, %s)""",
            (rut, nombre, fecha_nac, ingresos, apellido_p, apellido_m)
        )
        print("Cliente insertado correctamente")
    except Exception as e:
        print(f" Error: {e}")

def ver_segmentos():
    """Muestra segmentos"""
    segmentos = execute_query("SELECT * FROM segmento")
    print("\n SEGMENTOS:")
    for s in segmentos:
        print(f"  ID: {s[0]} | {s[2]} | Tamaño: {s[1]}")

def ver_productos():
    """Muestra productos bancarios"""
    productos = execute_query("SELECT * FROM producto_bancario")
    print("\n PRODUCTOS BANCARIOS:")
    for p in productos:
        print(f"  ID: {p[0]} | {p[1]} | Tipo: {p[2]}")

def main():
    """Función principal"""
    # Inicializar conexión
    init_connection_pool()
    
    try:
        while True:
            mostrar_menu()
            opcion = input("\nSelecciona una opción: ")
            
            if opcion == "1":
                ver_clientes()
            elif opcion == "2":
                ver_acciones()
            elif opcion == "3":
                ver_resultados()
            elif opcion == "4":
                generar_resultado()
            elif opcion == "5":
                buscar_cliente()
            elif opcion == "6":
                insertar_cliente()
            elif opcion == "7":
                ver_segmentos()
            elif opcion == "8":
                ver_productos()
            elif opcion == "9":
                break
            else:
                print("Opción inválida")
            
            input("\nPresiona ENTER para continuar...")
    
    except KeyboardInterrupt:
        print("\n\nAplicación interrumpida")
    
    finally:
        # Cerrar conexiones
        close_connection_pool()

if __name__ == "__main__":
    main()