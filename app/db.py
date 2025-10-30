import subprocess
import json

connection_pool = {'active': True}

def init_connection_pool():
    """Verifica que psql funcione"""
    global connection_pool
    try:
        result = subprocess.run(
            ['docker', 'exec', 'proyecto_bdd-postgres_db-1', 
             'psql', '-U', 'postgres', '-d', 'proyecto_bdd', '-c', 'SELECT 1;'],
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            print("[OK] Conexion creada exitosamente")
            connection_pool['active'] = True
        else:
            raise Exception(f"Error: {result.stderr}")
    except Exception as e:
        print(f"[ERROR] Error al conectar: {e}")
        raise

def execute_query(query, params=None):
    """Ejecuta una consulta SELECT"""
    try:
        result = subprocess.run(
            ['docker', 'exec', 'proyecto_bdd-postgres_db-1',
             'psql', '-U', 'postgres', '-d', 'proyecto_bdd', '-t', '-c', query],
            capture_output=True,
            text=True,
            encoding='utf-8',
            errors='replace'
        )
        if result.returncode == 0:
            rows = [line.strip().split('|') for line in result.stdout.strip().split('\n') if line.strip()]
            return [[col.strip() for col in row] for row in rows]
        else:
            raise Exception(result.stderr)
    except Exception as e:
        raise e

def execute_update(query, params=None):
    """Ejecuta INSERT, UPDATE, DELETE"""
    try:
        result = subprocess.run(
            ['docker', 'exec', 'proyecto_bdd-postgres_db-1',
             'psql', '-U', 'postgres', '-d', 'proyecto_bdd', '-c', query],
            capture_output=True,
            text=True
        )
        if result.returncode == 0:
            return 1
        else:
            raise Exception(result.stderr)
    except Exception as e:
        raise e

def call_procedure(proc_name, params):
    """Llama a un stored procedure"""
    try:
        params_str = ', '.join([str(p) for p in params])
        query = f"CALL {proc_name}({params_str});"
        result = subprocess.run(
            ['docker', 'exec', 'proyecto_bdd-postgres_db-1',
             'psql', '-U', 'postgres', '-d', 'proyecto_bdd', '-c', query],
            capture_output=True,
            text=True
        )
        if result.returncode != 0:
            raise Exception(result.stderr)
    except Exception as e:
        raise e

def close_connection_pool():
    """Cierra la conexion"""
    print("[OK] Conexion cerrada")