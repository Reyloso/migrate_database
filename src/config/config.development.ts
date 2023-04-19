import { Dialect } from 'sequelize/types';

export const config = {
    database: {
        dialect:'postgres' as Dialect,
        host: process.env.DB_HOST,
        port: +process.env.DB_PORT,
        database:process.env.DB_NAME,
        password:process.env.DB_PASSWORD,
        username:process.env.DB_USERNAME,
        autoLoadModels:true,
        synchronize:true
    }
}
