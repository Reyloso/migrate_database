import { Module } from '@nestjs/common';
import { MigrateService } from './migrate.service';
import { MigrateController } from './migrate.controller';

@Module({
  controllers: [MigrateController],
  providers: [MigrateService]
})
export class MigrateModule {}
