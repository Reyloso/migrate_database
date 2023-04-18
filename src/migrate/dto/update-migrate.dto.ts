import { PartialType } from '@nestjs/mapped-types';
import { CreateMigrateDto } from './create-migrate.dto';

export class UpdateMigrateDto extends PartialType(CreateMigrateDto) {}
