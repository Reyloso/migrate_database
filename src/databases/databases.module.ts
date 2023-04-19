import { Module } from '@nestjs/common';
import { DatabasesService, MigrateService } from './databases.service';
import { DatabasesController, MigrateController } from './databases.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Database, Migratelog } from './entities/database.entity';

@Module({
  controllers: [DatabasesController, MigrateController],
  providers: [DatabasesService, MigrateService],
  imports: [SequelizeModule.forFeature([Database, Migratelog])],
})
export class DatabasesModule {}
