import dotenv from 'dotenv';

dotenv.config({});

class Config {
	public DATABASE_URL: string | undefined;
	public JWT_TOKEN: string | undefined;
	public NODE_ENV: string | undefined;
	public SECRET_KEY_ONE: string | undefined;
	public SECRET_KEY_TWO: string | undefined;
	public CLIENT_URL: string | undefined;
	public CLIENT_URL_DEV: string | undefined;
	public SERVER_PORT: string | number | undefined;
	public NAME_DB: string | undefined;
	public USER_DB: string | undefined;
	public PWD_DB: string | undefined;
	public BASE_PATH: string | undefined;

	constructor() {
		this.DATABASE_URL = process.env.DATABASE_URL;
		this.JWT_TOKEN = process.env.JWT_TOKEN;
		this.NODE_ENV = process.env.NODE_ENV; // || ''
		this.SECRET_KEY_ONE = process.env.SECRET_KEY_ONE;
		this.SECRET_KEY_TWO = process.env.SECRET_KEY_TWO;
		this.CLIENT_URL = process.env.CLIENT_URL;
		this.CLIENT_URL_DEV = process.env.CLIENT_URL_DEV;
		this.SERVER_PORT = process.env.SERVER_PORT;
		this.NAME_DB = process.env.NAME_DB;
		this.USER_DB = process.env.USER_DB;
		this.PWD_DB = process.env.PWD_DB;
		this.BASE_PATH = process.env.BASE_PATH;
	}

	public validateConfig(): void {
		console.log(this);
		for (const [key, value] of Object.entries(this)) {
			if (value === undefined) {
				throw new Error(`Configuration ${key} is undefindes`);
			}
		}
	}
}

export const config: Config = new Config();
