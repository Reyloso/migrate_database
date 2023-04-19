import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { SequelizeModule } from '@nestjs/sequelize';
import { DatabasesModule } from './databases/databases.module';
import { InvoicesModule } from './invoices/invoices.module';
import { Dialect } from 'sequelize/types';

@Module({
  imports: [
    ConfigModule.forRoot(),
    SequelizeModule.forRoot({
      dialect:'postgres' as Dialect,
      host: process.env.DB_HOST,
      port: +process.env.DB_PORT,
      database:process.env.DB_NAME,
      password:process.env.DB_PASSWORD,
      username:process.env.DB_USERNAME,
      autoLoadModels:true,
      synchronize:true
  }),
    DatabasesModule,
    InvoicesModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
