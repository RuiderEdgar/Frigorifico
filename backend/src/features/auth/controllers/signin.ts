import { Response, Request } from 'express';
import HTTP_STATUS from 'http-status-codes';
import JWT from 'jsonwebtoken';
import { loginSchema } from '@auth/schemas/signin';
import { joiValidation } from '@decorators/joi-validation.decorators';
import AuthService from '@services/db/auth.service';
import { BadRequestError } from '@helpers/errors/badRequestError';
import { config } from '@configs/configEnvs';
import { IAuthUser } from '@auth/interfaces/authDocument';

export class SignIn {
	private authService: AuthService;

	constructor(authService: AuthService) {
		this.authService = authService;
	}

	@joiValidation(loginSchema)
	public async read(req: Request, res: Response): Promise<void> {
		const { username, password } = req.body;

		const existingUser: IAuthUser | null = await this.authService.getUserByUsername(username);
		const passwordMatch: boolean = config.PWD_DB === password;
		//usuario invalido
		if (!existingUser) {
			throw new BadRequestError('User invalid');
		}
		//usuario valido, contraseña invalida
		if (!passwordMatch) {
			throw new BadRequestError('Password invalid');
		}

		const userJWT: string = JWT.sign(
			{
				username: existingUser.username,
				password: existingUser.password
			},
			config.JWT_TOKEN!
		);

		req.session = { jwt: userJWT };
		res.status(HTTP_STATUS.OK).json({ message: 'User login successfully', user: existingUser, token: userJWT });
	}
}
