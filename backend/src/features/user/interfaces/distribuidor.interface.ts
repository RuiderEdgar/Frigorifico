import { Model } from 'sequelize';

export interface IDistribuidorModel extends Model {
	id_distribuidor: number;
	nombre_distribuidor: string;
	direccion_distribuidor: string;
	correo_distribuidor: string;
	receptor_autorizado: string;
}
