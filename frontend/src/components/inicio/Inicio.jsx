import { Button } from '../Button.jsx/Button';
import logoCarniceria from '../../assets/images/selecta.png';
import styles from './Inicio.module.css';

export const Inicio = ({ view }) => {
	const handlerButton = () => {
		view(false);
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
