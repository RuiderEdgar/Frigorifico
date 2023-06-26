import { useState } from 'react';
import axios from 'axios';
import { PersonCircle } from 'react-bootstrap-icons';
import { Button } from '../../components/Button.jsx/Button';
import { LogoQuetzal } from '../../components/LogoQuetzal/LogoQuetzal';
import styles from './login.module.css';

export const Login = () => {
	const [name, setName] = useState('')
	const [password, setPassword] = useState('')

	const handlerButton = async (event) => {
		event.prevebtDefault();

		const formData = {
    name: name,
    password: password
  }

	try {
			console.log(formData)
    // Realiza la petición POST al servidor utilizando axios
    const response = await axios.post('http://localhost:5000/api/v1/signin', formData);

    // Realiza las acciones necesarias con la respuesta del servidor
    console.log(response.data);
		} catch (error) {
			// Manejo de errores
			console.error('Error al enviar el formulario:', error);
		}
	}

	return (
		<main className={styles.background}>
			<section className={styles.loginContainer}>
				<header>
					<PersonCircle size={80} color="white" />
				</header>
				<form method="POST" action="http://localhost:5000/api/v1/signin" className={styles.formContainer}>
					<div className={`${styles.labelInputContainer} ${styles.labelContainer}`}>
						<label className={styles.label} htmlFor="user">
							USER:
						</label>
						<label className={styles.label} htmlFor="password">
							PASSWORD:
						</label>
					</div>
					<div className={`${styles.labelInputContainer} ${styles.inputContainer}`}>
						<input
							className={styles.input}
							type="text"
							name="user"
							value={name}
							onChange={e => setName(e.target.value)}
						/>
						<input
							className={styles.input}
							type="password"
							name="password"
							value={password}
							onChange={e => setPassword(e.target.value)}
						/>
						<Button text={'Iniciar'} handlerButton={handlerButton} />
					</div>
				</form>
			</section>
			<LogoQuetzal/>
		</main>
	);
};
