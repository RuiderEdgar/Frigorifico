import { Button } from '../../components/Button.jsx/Button';
import logoCarniceria from '../../assets/images/selecta.png';
import styles from './Inicio.module.css';

export const Inicio = () => {
	const handlerButton = () => {
		window.location.href = '/login'
	};
	return (
		<>
			<header className={styles.inicioContainer}>
				<div>
					<img src={logoCarniceria} alt="logo carnicería" className={styles.logoCarniceria} />
				</div>
				<section className={styles.titleContainer}>
					<h2 className={styles.title}>!Bienvenido!</h2>
					<Button text={'INGRESAR'} handlerButton={handlerButton} />
				</section>
			</header>
		</>
	);
};
