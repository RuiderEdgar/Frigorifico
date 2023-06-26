import express, { Router } from 'express';
import DistribuidorService from '@services/db/distribuidor.service';
import FrigorificoDB from '@bootstrap/setupDatabase.bootstrap';
import { Information } from '@user/controllers/distribuidor/information';

class UserRouters {
	private router: Router;

	constructor() {
		this.router = express.Router();
		const distribuidorService = new DistribuidorService(FrigorificoDB);
		const informationController = new Information(distribuidorService);
		this.router.get('/home/distribuidor/information', informationController.obtenerDistribuidores);
	}

	public routes(): Router {
		return this.router;
	}
}

export const userRoutes: UserRouters = new UserRouters();
