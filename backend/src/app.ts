import express, { Express } from 'express';
import { FrigorificoServer } from '@bootstrap/setupServer.bootstrap';
import { config } from '@configs/configEnvs';
import databaseConnection from '@bootstrap/setupDatabase.bootstrap';

class Application {
	public initialize(): void {
		this.loadConfig();
		databaseConnection();
		const app: Express = express();
		const server: FrigorificoServer = new FrigorificoServer(app);
		server.start();
	}

	private loadConfig(): void {
		config.validateConfig();
	}
}

const aplication: Application = new Application();
aplication.initialize();
