import { Inicio } from './routes/inicio/Inicio';
import { LogoQuetzal } from './components/LogoQuetzal/LogoQuetzal';
import styles from './App.module.css';

function App() {

	return (
		<>
			<main className={styles.background}>
				<Inicio/>
				<LogoQuetzal/>
			</main>
		</>
	);
}

export default App;
