import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { DatabasesModule } from './databases/databases.module';
import { MigrateModule } from './migrate/migrate.module';
import { EmployeesModule } from './employees/employees.module';

@Module({
  imports: [
    ConfigModule.forRoot(),
    TypeOrmModule.forRoot({
      type: 'postgres',
      host: process.env.DB_HOST,
      port: +process.env.DB_PORT,
      database:process.env.DB_NAME,
      password:process.env.DB_PASSWORD,
      username:process.env.DB_USERNAME,
      autoLoadEntities:true,
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
