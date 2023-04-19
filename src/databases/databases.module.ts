import { Module } from '@nestjs/common';
import { DatabasesService, MigrateService } from './databases.service';
import { DatabasesController, MigrateController } from './databases.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Database, Migratelog } from './entities/database.entity';
import { Invoice } from 'src/invoices/entities/invoice.entity';

@Module({
  controllers: [DatabasesController, MigrateController],
  providers: [DatabasesService, MigrateService],
  imports: [Invoice,SequelizeModule.forFeature([Database, Migratelog])],
})
export class DatabasesModule {}
