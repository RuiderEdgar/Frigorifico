// import { Connection } from 'tedious';
import { Sequelize } from 'sequelize';
import Logger from 'bunyan';
import { config } from '@configs/configEnvs';
import { logger } from '@configs/configLogs';

const log: Logger = logger.createLogger('setupDatabase');

const FrigorificoDB = new Sequelize(config.NAME_DB!, config.USER_DB!, config.PWD_DB!, {
	host: config.DATABASE_URL,
	dialect: 'mssql',
	dialectOptions: {
		options: {
			encrypt: false,
			trustServerCertificate: false
		}
	}
});

const testingConnection = () => {
	FrigorificoDB.authenticate()
		.then(() => {
			log.info('Connection has been established successfully');
		})
		.catch(err => {
			log.error('Error al conectar a la base de datos:', err);
		});
};

export default FrigorificoDB;
export { testingConnection };
