import { Injectable } from '@nestjs/common';
import { CreateMigrateLogDto } from './dto/create-migrate.dto';
import { UpdateMigrateDto } from './dto/update-migrate.dto';

@Injectable()
export class MigrateService {
  create(createMigrateDto: CreateMigrateLogDto) {
    return 'This action adds a new migrate';
  }

  findAll() {
    return `This action returns all migrate`;
  }

  findOne(id: number) {
    return `This action returns a #${id} migrate`;
  }

  update(id: number, updateMigrateDto: UpdateMigrateDto) {
    return `This action updates a #${id} migrate`;
  }

  remove(id: number) {
    return `This action removes a #${id} migrate`;
  }
}
