import { useEffect, useState } from 'react';
import axios from 'axios';
import { PersonCircle, ArrowLeftCircleFill } from 'react-bootstrap-icons';
import { LogoQuetzal } from '../../components/LogoQuetzal/LogoQuetzal';
import styles from './DistribuidorList.module.css';

export const DistribuidoresList = () => {
	const [distribuidores, setDistribuidores] = useState([]);

	useEffect(() => {
		const fetchData = async () => {
			try {
				const response = await axios.get('http://localhost:5000/api/v1/home/distribuidor/information');
				setDistribuidores(response.data);
			} catch (error) {
				console.error('Error al obtener los distribuidores:', error);
			}
		};

		fetchData();
	}, []);

	return (
		<>
			<header className={styles.backgroundHeader}>
				<nav>
					<a href="/home" className={styles.nav}>
						<ArrowLeftCircleFill size={30} color={'white'} />
					</a>
				</nav>
				<div className={styles.userContainer}>
					<h2 className={styles.username}>ADMIN001</h2>
					<PersonCircle size={80} className={styles.avatar} />
				</div>
			</header>
			<div className={styles.container}>
				<h1>Lista de Distribuidores</h1>
				<ul className={styles.list}>
					{distribuidores.map(distribuidor => (
						<li key={distribuidor.id_distribuidor} className={styles.item}>
							<div>
								<strong>Nombre:</strong> {distribuidor.nombre_distribuidor}
							</div>
							<div>
								<strong>Dirección:</strong> {distribuidor.direccion_distribuidor}
							</div>
							<div>
								<strong>Correo:</strong> {distribuidor.correo_distribuidor}
							</div>
							<div>
								<strong>Receptor Autorizado:</strong> {distribuidor.receptor_autorizado}
							</div>
						</li>
					))}
				</ul>
				<LogoQuetzal />
			</div>
		</>
	);
};

