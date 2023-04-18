import { Injectable } from '@nestjs/common';
import { CreateMigrateDto } from './dto/create-migrate.dto';
import { UpdateMigrateDto } from './dto/update-migrate.dto';

@Injectable()
export class MigrateService {
  create(createMigrateDto: CreateMigrateDto) {
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
