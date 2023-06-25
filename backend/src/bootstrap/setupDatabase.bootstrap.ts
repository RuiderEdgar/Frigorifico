import { Connection } from 'tedious';
import Logger from 'bunyan';
import { config } from '@configs/configEnvs';
import { logger } from '@configs/configLogs';

const log: Logger = logger.createLogger('setupDatabase');

export default (): Connection => {
	const configSql = {
		server: 'localhost',
		authentication: {
			type: 'default',
			options: {
				userName: `${config.USER_DB}`,
				password: `${config.PWD_DB}`
			}
		},
		options: {
			encrypt: false,
			database: `${config.NAME_DB}`,
			trustServerCertificate: false
		}
	};

	const connection = new Connection(configSql);

	connection.on('connect', err => {
		if (err) {
			log.error('Error al conectar a la base de datos:', err.message);
		} else {
			log.info('Conexión exitosa a la base de datos');
		}
	});

	connection.connect();

	return connection;
};
