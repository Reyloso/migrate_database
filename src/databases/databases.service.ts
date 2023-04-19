import { Injectable, InternalServerErrorException, Param, ParseUUIDPipe } from '@nestjs/common';
import { CreateDatabaseDto, CreateMigrateLogDto } from './dto/create-database.dto';
import { UpdateDatabaseDto, UpdateMigrateLogDto } from './dto/update-database.dto';
import { Database, Migratelog } from './entities/database.entity';
import { InjectModel } from '@nestjs/sequelize';


@Injectable()
export class DatabasesService {

  constructor(
    @InjectModel(Database)
    private readonly DatabaseModel: typeof Database,

  ){}

  async create(createDatabaseDto: CreateDatabaseDto) {
    try{
      const database = await this.DatabaseModel.create({...createDatabaseDto});

      return {"message":"[Database] creada correctamente", "code":1, "data":database}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear [Database]", "code":2, "data":null}
    }
  }

  async findAll() {
    try{

      const database = await this.DatabaseModel.findAll({where : {status:true, deleted_at:null}})

      if (database.length === 0){
        return {"message":"no se encontraron [Databases]", "code":2, "data":null}
      }

      return {"message":"lista de [Databases]", "code":1, "data":database}

    }catch(error){

      return {"message":"no se pudo consultar [Database]", "code":2, "data":null}
    }
  }
  
  async findOne(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = await this.DatabaseModel.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una [Database] con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de [Database]", "code":1, "data":database}
      
    }catch(error){

      return {"message":"no se pudo e [Database]", "code":2, "data":null}

    }
  }

  async update(@Param('id', ParseUUIDPipe) id:string, updateDatabaseDto: UpdateDatabaseDto) {
    try{

      const database = await this.DatabaseModel.update(updateDatabaseDto ,{where : {id: id}});
      if ( !database )
        return {"message":`no se encontro una [Database] con el id ${id}`, "code":2, "data":null}

      const data = await this.DatabaseModel.findOne({where : {id: id, deleted_at:null}})

      return {"message":"[Database] actualizada correctamente", "code":1, "data":data}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar [Database]", "code":2, "data":null}
    }
  }
  
  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = this.DatabaseModel.findOne({where : {id: id, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una [Database] con el id ${id}`, "code":2, "data":null}

      await this.DatabaseModel.destroy({where : {id: id, deleted_at:null}})

      return {"message":"[Database] eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar [Database]", "code":2, "data":null}
    }
  }
}


@Injectable()
export class MigrateService {

  constructor(
    @InjectModel(Migratelog)
    private readonly MigrateModel: typeof Migratelog,

  ){}

  async create(createMigrateLogDto: CreateMigrateLogDto) {
    try{
      const migrateLog = await this.MigrateModel.create({...createMigrateLogDto});

      return {"message":"[Migrate_log] creada correctamente", "code":1, "data":migrateLog}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear [Migrate_log]", "code":2, "data":null}
    }
  }

  async findAll() {
    try{

      const migrateLog = await this.MigrateModel.findAll({where : {status:true, deleted_at:null}})

      if (migrateLog.length === 0){
        return {"message":"no se encontraron [Migrate_log]", "code":2, "data":null}
      }

      return {"message":"lista de [Migrate_log]", "code":1, "data":migrateLog}

    }catch(error){

      return {"message":"no se pudo consultar [Migrate_log]", "code":2, "data":null}
    }
  }
  
  async findOne(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const migrateLog = await this.MigrateModel.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !migrateLog )
        return {"message":`no se encontro una [Migrate_log] con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de [Migrate_log]", "code":1, "data":migrateLog}
      
    }catch(error){

      throw new InternalServerErrorException("No se pudo crear el objeto", error)

    }
  }

  async update(@Param('id', ParseUUIDPipe) id:string, updateMigrateLogDto: CreateMigrateLogDto) {
    try{

      const migrateLog = await this.MigrateModel.update(updateMigrateLogDto ,{where : {id: id}});
      if ( !migrateLog )
        return {"message":`no se encontro una [Migrate_log] con el id ${id}`, "code":2, "data":null}

      const data = await this.MigrateModel.findOne({where : {id: id, deleted_at:null}})

      return {"message":"[Migrate_log] actualizada correctamente", "code":1, "data":data}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar [Migrate_log]", "code":2, "data":null}
    }
  }
  
  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const migrateLog = this.MigrateModel.findOne({where : {id: id, deleted_at:null}})

      if ( !migrateLog )
        return {"message":`no se encontro una [Migrate_log] con el id ${id}`, "code":2, "data":null}

      await this.MigrateModel.destroy({where : {id: id, deleted_at:null}})

      return {"message":"[Migrate_log] eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar [Migrate_log]", "code":2, "data":null}
    }
  }
}
