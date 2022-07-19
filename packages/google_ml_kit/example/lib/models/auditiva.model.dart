class Auditiva {
  var nombre;
  var imagen;
  Auditiva({ this.nombre, this.imagen});
  factory Auditiva.fromJson( Map<String, dynamic> json) {
    return Auditiva( nombre: json['apellido'], imagen: json['telefono'] );
  }
}
