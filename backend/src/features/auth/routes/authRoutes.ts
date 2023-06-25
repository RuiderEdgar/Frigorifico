import express, { Router } from 'express';
import { SignIn } from '@auth/controllers/signin';
import AuthService from '@services/db/auth.service';
import FrigorificoDB from '@bootstrap/setupDatabase.bootstrap';
class AuthRouters {
	private router: Router;

	constructor() {
		this.router = express.Router();
		const authService = new AuthService(FrigorificoDB); // Crea una instancia de AuthService
		const signInController = new SignIn(authService); // Crea una instancia de SignIn y pasa authService como argumento
		this.router.post('/signin', signInController.read.bind(signInController)); // Asocia el método read del controlador
	}

	public routes(): Router {
		return this.router;
	}
}

export const authRoutes: AuthRouters = new AuthRouters();
