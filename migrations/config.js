require('dotenv').config()

console.log("hola mundo", process.env.DB_HOST)
module.exports = {
    development: {
        dialect:'postgres',
        host: process.env.DB_HOST,
        port: +process.env.DB_PORT,
        database:process.env.DB_NAME,
        password:process.env.DB_PASSWORD,
        username:process.env.DB_USERNAME,
        autoLoadModels:true,
        synchronize:true
    }
}