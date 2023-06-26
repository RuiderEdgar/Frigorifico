import { Sequelize } from 'sequelize';
import { QueryTypes } from 'sequelize';
import { IDistribuidorModel } from '@user/interfaces/distribuidor.interface';

class DistribuidorService {
	private sequelize: Sequelize;

	constructor(sequelize: Sequelize) {
		this.sequelize = sequelize;
	}

	public async getDistribuidores(): Promise<IDistribuidorModel[]> {
		const query = `
      SELECT id_distribuidor, nombre_distribuidor, direccion_distribuidor, correo_distribuidor, receptor_autorizado
      FROM Distribuidor
    `;
		const distribuidores: IDistribuidorModel[] = await this.sequelize.query(query, {
			type: QueryTypes.SELECT
		});

		return distribuidores;
	}
}

export default DistribuidorService;
