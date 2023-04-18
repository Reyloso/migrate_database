import { Controller, Get, Post, Body, Patch, Param, Delete, ParseUUIDPipe } from '@nestjs/common';
import { DatabasesService, MigrateService } from './databases.service';
import { CreateDatabaseDto, CreateMigrateLogDto } from './dto/create-database.dto';
import { UpdateDatabaseDto, UpdateMigrateLogDto } from './dto/update-database.dto';

@Controller('databases')
export class DatabasesController {
  constructor(private readonly databasesService: DatabasesService) {}

  @Post()
  create(@Body() createDatabaseDto: CreateDatabaseDto) {
    return this.databasesService.create(createDatabaseDto);
  }

  @Get()
  findAll() {
    return this.databasesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.databasesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id', ParseUUIDPipe) id: string, @Body() updateDatabaseDto: UpdateDatabaseDto) {
    return this.databasesService.update(id, updateDatabaseDto);
  }

  @Delete(':id')
  remove(@Param('id', ParseUUIDPipe) id: string) {
    return this.databasesService.remove(id);
  }
}

@Controller('Migrate')
export class MigrateController {
  constructor(private readonly MigrateService: MigrateService) {}

  @Post()
  create(@Body() createMigrateLogDto: CreateMigrateLogDto) {

    return this.MigrateService.create(createMigrateLogDto);
  }

  @Get()
  findAll() {
    return this.MigrateService.findAll();
  }

  @Get(':id')
  findOne(@Param('id', ParseUUIDPipe) id: string) {
    return this.MigrateService.findOne(id);
  }

}
