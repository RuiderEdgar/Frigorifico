import { IAuthUser } from '@auth/interfaces/authDocument';
import { Connection, Request, TYPES } from 'tedious';
import { config } from '@configs/configEnvs';

class AuthService {
	private connection: Connection;

	constructor(connection: Connection) {
		this.connection = connection;
	}

	public async getUserByUsername(username: string): Promise<IAuthUser | null> {
		const query = 'USE FrigorificoDB; SELECT name FROM sys.server_principals WHERE name = @username;';

		return new Promise<IAuthUser | null>((resolve, reject) => {
			// eslint-disable-next-line @typescript-eslint/no-explicit-any
			const request = new Request(query, (error: Error, rowCount: number, rows: any[]) => {
				if (error) {
					reject(error);
				} else {
					// if (rowCount > 0) {
					// 	const authUser: IAuthUser = {
					// 		username: rows[0].name,
					// 		password: `${config.PWD_DB}`
					// 	};
					// 	resolve(authUser);
					// } else {
					// 	resolve(null);
					// }
					if (rowCount === 0) {
						resolve(null); // No se encontraron resultados, devolver null
					} else {
						console.log(rows);
						const authUser: IAuthUser = {
							username: rows[0],
							password: `${config.PWD_DB}`
						};
						resolve(authUser);
					}
				}
			});

			request.addParameter('username', TYPES.NVarChar, username);

			this.connection.execSql(request);
		});
	}
}

export default AuthService;
