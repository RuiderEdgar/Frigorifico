import { useState } from 'react';
// import reactLogo from './assets/react.svg'
// import viteLogo from '/vite.svg'
import { Inicio } from './components/inicio/Inicio';
import { Login } from './components/login/login';
import styles from './App.module.css';
import logo from './assets/images/quetzalByte.png';

function App() {
	const [viewInicio, setViewInicio] = useState(true);

	const vistas = () => {
		if (viewInicio) {
			return <Inicio view={setViewInicio} />;
		} else {
			return <Login />;
		}
	};

	return (
		<>
			<main className={styles.background}>
				{vistas()}
				<div className={styles.logoContainer}>
					<img className={styles.logo} src={logo} alt="logo" />
				</div>
			</main>
		</>
	);
}

export default App;
