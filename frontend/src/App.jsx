import { useEffect, useState } from 'react';
import { probarConexion } from './services/api';

function App() {
  const [mensajeBackend, setMensajeBackend] = useState('Conectando con el backend...');

  useEffect(() => {
    probarConexion()
      .then(setMensajeBackend)
      .catch(() => setMensajeBackend('No se pudo conectar con el backend'));
  }, []);

  return (
    <main className="app">
      <h1>Operación Panito</h1>
      <p>{mensajeBackend}</p>
    </main>
  );
}

export default App;
