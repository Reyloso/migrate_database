import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { MigrateService } from './migrate.service';
import { CreateMigrateDto } from './dto/create-migrate.dto';
import { UpdateMigrateDto } from './dto/update-migrate.dto';

@Controller('migrate')
export class MigrateController {
  constructor(private readonly migrateService: MigrateService) {}

  @Post()
  create(@Body() createMigrateDto: CreateMigrateDto) {
    return this.migrateService.create(createMigrateDto);
  }

  @Get()
  findAll() {
    return this.migrateService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.migrateService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMigrateDto: UpdateMigrateDto) {
    return this.migrateService.update(+id, updateMigrateDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.migrateService.remove(+id);
  }
}
