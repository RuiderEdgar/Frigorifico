import { Request, Response } from 'express';
import HTTP_STATUS from 'http-status-codes';
import DistribuidorService from '@services/db/distribuidor.service';
import { IDistribuidorModel } from '@user/interfaces/distribuidor.interface';

export class Information {
	private distribuidorService: DistribuidorService;

	constructor(distribuidorService: DistribuidorService) {
		this.distribuidorService = distribuidorService;
	}

	public obtenerDistribuidores = async (req: Request, res: Response): Promise<void> => {
		try {
			const distribuidores: IDistribuidorModel[] = await this.distribuidorService.getDistribuidores();
			res.status(HTTP_STATUS.OK).json(distribuidores);
		} catch (error) {
			res.status(HTTP_STATUS.NO_CONTENT).json({ message: 'Error al obtener los distribuidores' });
		}
	};
}
