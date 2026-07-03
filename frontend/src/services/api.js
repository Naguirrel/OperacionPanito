const API_URL = 'http://localhost:3001';

export async function probarConexion() {
  const respuesta = await fetch(API_URL);

  if (!respuesta.ok) {
    throw new Error('No se pudo conectar con el backend');
  }

  return respuesta.text();
}
