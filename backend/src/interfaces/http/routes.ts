import { Application } from 'express';
import { config } from '@configs/configEnvs';
//rutas
import { authRoutes } from '@auth/routes/authRoutes';
import { userRoutes } from '@user/routes/userRoutes';

export default (app: Application) => {
	const routes = () => {
		app.use(config.BASE_PATH!, authRoutes.routes());
		app.use(config.BASE_PATH!, userRoutes.routes());
	};
	routes();
};
