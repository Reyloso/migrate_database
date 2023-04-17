import { Module } from '@nestjs/common';
import { DatabasesService } from './databases.service';
import { DatabasesController } from './databases.controller';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Database } from './entities/database.entity';

@Module({
  controllers: [DatabasesController],
  providers: [DatabasesService],
  imports: [TypeOrmModule.forFeature([Database])],
})
export class DatabasesModule {}
