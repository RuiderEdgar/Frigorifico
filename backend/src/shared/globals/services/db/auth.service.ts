import { QueryTypes } from 'sequelize';
import { IAuthUser } from '@auth/interfaces/authDocument';
import { config } from '@configs/configEnvs';
import { Sequelize } from 'sequelize';

class AuthService {
	private sequelize: Sequelize;

	constructor(sequelize: Sequelize) {
		this.sequelize = sequelize;
	}

	public async getUserByUsername(user: string): Promise<IAuthUser | null> {
		const query = `
		USE FrigorificoDB;
		SELECT name, '${config.PWD_DB}' AS password
		FROM sys.server_principals
		WHERE name = :user;
		`;

		try {
			const [results] = await this.sequelize.query(query, {
				replacements: { user: user },
				type: QueryTypes.SELECT
			});
			console.log('contenido de results:', results);
			if (!results || Object.values(results).length === 0) {
				return null;
			}

			const authUser: IAuthUser = Object.values(results)[0];
			return authUser;
		} catch (error) {
			throw new Error(`Error al buscar el usuario por nombre de usuario: ${error}`);
		}
	}
}

export default AuthService;
