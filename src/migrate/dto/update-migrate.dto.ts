import { PartialType } from '@nestjs/mapped-types';
import { CreateMigrateLogDto } from './create-migrate.dto';

export class UpdateMigrateDto extends PartialType(CreateMigrateLogDto) {}
