import { PersonCircle } from 'react-bootstrap-icons';
import { Button } from '../Button.jsx/Button';
import styles from './login.module.css';

export const Login = () => {
	return (
		<>
			<section className={styles.loginContainer}>
				<header>
					<PersonCircle size={80} color="white" />
				</header>
				<section className={styles.formContainer}>
					<div className={`${styles.labelInputContainer} ${styles.labelContainer}`}>
						<label className={styles.label} htmlFor="user">
							USER:
						</label>
						<label className={styles.label} htmlFor="password">
							PASSWORD:
						</label>
					</div>
					<div className={`${styles.labelInputContainer} ${styles.inputContainer}`}>
						<input className={styles.input} type="text" name="user" />
						<input className={styles.input} type="password" name="password" />
						<Button text={'Iniciar'} />
					</div>
				</section>
			</section>
		</>
	);
};
