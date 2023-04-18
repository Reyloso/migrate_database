import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { SequelizeModule } from '@nestjs/sequelize';
import { MigrateModule } from './migrate/migrate.module';
import { EmployeesModule } from './employees/employees.module';
import { DatabasesModule } from './databases/databases.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    SequelizeModule.forRoot({
      dialect:'postgres',
      host: process.env.DB_HOST,
      port: +process.env.DB_PORT,
      database:process.env.DB_NAME,
      password:process.env.DB_PASSWORD,
      username:process.env.DB_USERNAME,
      autoLoadModels:true,
      synchronize:true
    }),
    DatabasesModule,
    MigrateModule,
    EmployeesModule,
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
