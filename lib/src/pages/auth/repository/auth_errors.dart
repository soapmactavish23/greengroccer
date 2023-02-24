String authErrorsString(String? code) {
  switch (code) {
    case 'INVALID_CREDENTIALS':
      return 'E-mail ou senha inválidos';
    case 'Invalid session token':
      return 'Token inválido';
    default:
      return 'Um erro indefinido ocorreu';
  }
}
