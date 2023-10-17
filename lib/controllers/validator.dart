class Validator {
  static validar(value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } 
    return null;
  }
}
