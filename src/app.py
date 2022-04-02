
from flask import Flask, jsonify, request
from flask_mysqldb import MySQL
from config import config

app = Flask(__name__)
conexion = MySQL(app)

@app.route('/')
def index():
    return "Mi nombre es Bibi"

@app.route('/juegos', methods=['GET'])
def Mostrarjuegos():
    try:
        cursor= conexion.connection.cursor()
        sql="SELECT id, nombre, descripcion, precio FROM juegos"
        cursor.execute(sql)
        datos=cursor.fetchall()
        juegos=[]
        for fila in datos:
            unjuego={'id':fila[0], 'nombre':fila[1],'descripcion':fila[2], 'precio':fila[3] }
            juegos.append(unjuego)
        return jsonify({'juegos':juegos, 'mensaje': 'juegos en la lista'})
    except Exception as ex:
        return jsonify({'mensaje': 'Error'})

@app.route('/juegos/<int:idjuego>', methods=['GET'])
def verjuego(idjuego):
    try:
        cursor= conexion.connection.cursor()
        sql="SELECT id, nombre, descripcion, precio FROM juegos WHERE id = '{0}'".format(idjuego)
        cursor.execute(sql)
        datos=cursor.fetchone()
        if datos ==None:
            return jsonify({'mensaje': 'Juego no encontrado, el id no corresponde con un juego'})
        else:
            unjuego={'id':datos[0], 'nombre':datos[1],'descripcion':datos[2], 'precio':datos[3] }
            return jsonify({'juego':unjuego, 'mensaje': 'juegos en la lista'})
    except Exception as ex:
        return jsonify({'mensaje': 'Error'})

@app.route('/juegos', methods=['POST'])
def insertarjuego():
    try:
        cursor= conexion.connection.cursor()
        cursor.execute("INSERT INTO juegos(id,nombre, descripcion, precio) VALUES (%s,%s, %s, %s)",(request.json['id'],request.json['nombre'],request.json['descripcion'] , request.json['precio']))
        conexion.connection.commit()  #confirmamo
        return jsonify({'mensaje': 'Juego Registrado'})
    except Exception as ex:
        return 'Error'

@app.route('/juegos/<int:idjuego>', methods=['DELETE'])
def Borrarjuego(idjuego):
    try:
        cursor= conexion.connection.cursor()
        sql="DELETE FROM juegos WHERE id = '{0}'".format(idjuego)
        cursor.execute(sql)
        conexion.connection.commit()
        return jsonify({'mensaje': 'curso eliminado'})
    except Exception as ex:
        return 'Error'

def pagina_no_encontrada(error):
    return "<h1>Página no encontrada</h1>", 404

if __name__ == '__main__':
    app.config.from_object(config['development'])
    app.register_error_handler(404, pagina_no_encontrada)
    app.run(debug=True)