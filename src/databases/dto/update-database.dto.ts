import { PartialType } from '@nestjs/mapped-types';
import { CreateDatabaseDto, CreateMigrateLogDto } from './create-database.dto';

export class UpdateDatabaseDto extends PartialType(CreateDatabaseDto) {}
export class UpdateMigrateLogDto extends PartialType(CreateMigrateLogDto) {}
