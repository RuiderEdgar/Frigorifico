import { PersonCircle } from 'react-bootstrap-icons';
import { ButtonOption } from '../../components/ButtonOption/ButtonOption';
import { LogoQuetzal } from '../../components/LogoQuetzal/LogoQuetzal';
import styles from './Home.module.css';

export const Home = () => {
	const handlerButton = () => {
		window.location.href = '/home/distribuidor';
	};
	return (
		<>
			<header className={styles.backgroundHeader}>
				<h2 className={styles.username}>ADMIN001</h2>
				<PersonCircle size={80} className={styles.avatar} />
			</header>
			<main className={styles.main}>
				<header className={styles.mainHeader}>
					<h1>SELECCIONE UNA OPCIÓN</h1>
				</header>
				<section>
					<ButtonOption text={'CONSULTAR DISTRIBUIDORES'} handlerButton={handlerButton} />
				</section>
			</main>
			<LogoQuetzal />
		</>
	);
}
