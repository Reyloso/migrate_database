import { Module } from '@nestjs/common';
import { DatabasesService } from './databases.service';
import { DatabasesController } from './databases.controller';
import { SequelizeModule } from '@nestjs/sequelize';
import { Database } from './entities/database.entity';

@Module({
  controllers: [DatabasesController],
  providers: [DatabasesService],
  imports: [SequelizeModule.forFeature([Database])],
})
export class DatabasesModule {}
