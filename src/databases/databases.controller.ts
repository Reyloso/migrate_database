import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { DatabasesService, MigrateService } from './databases.service';
import { CreateDatabaseDto,  } from './dto/create-database.dto';
import { UpdateDatabaseDto,  } from './dto/update-database.dto';

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
  findOne(@Param('id') id: number) {
    return this.databasesService.findOne(id);
  }

  @Patch(':id')
  update(@Param('id') id: number, @Body() updateDatabaseDto: UpdateDatabaseDto) {
    return this.databasesService.update(id, updateDatabaseDto);
  }

  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.databasesService.remove(id);
  }
}

@Controller('Migrate')
export class MigrateController {
  constructor(private readonly MigrateService: MigrateService) {}

  @Post(':id')
  create(@Body() body:any, @Param('id') id: number) {

    return this.MigrateService.create(id);
  }

  @Get()
  findAll() {
    return this.MigrateService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.MigrateService.findOne(id);
  }

}
