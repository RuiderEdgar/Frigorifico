import styles from './LogoQuetzal.module.css'
import logo from '../../assets/images/quetzalByte.png'

export const LogoQuetzal = () => {
	return (
		<div className={styles.logoContainer}>
			<img className={styles.logo} src={logo} alt="logo" />
		</div>
	);
}
