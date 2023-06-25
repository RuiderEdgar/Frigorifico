import express, { Router, Request, Response } from 'express';
import { SignIn } from '@auth/controllers/signin';
import { Connection } from 'tedious';
import databaseConnection from '@bootstrap/setupDatabase.bootstrap';
import AuthService from '@services/db/auth.service';

class AuthRouters {
	private router: Router;
	private authService: AuthService;

	constructor() {
		this.router = express.Router();
		const connection: Connection = databaseConnection(); // Obtener la instancia de Connection desde setupDatabase.ts
		this.authService = new AuthService(connection); // Crear una instancia de AuthService con la conexión

		this.router.post('/signin', this.signInHandler.bind(this));
	}

	private async signInHandler(req: Request, res: Response): Promise<void> {
		const signInController = new SignIn(this.authService);
		await signInController.read(req, res);
	}

	public routes(): Router {
		return this.router;
	}
}

export const authRoutes: AuthRouters = new AuthRouters();
