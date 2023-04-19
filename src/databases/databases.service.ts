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

      return {"message":"database creada correctamente", "code":1, "data":database}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear database", "code":2, "data":null}
    }
  }

  async findAll() {
    try{

      const database = await this.DatabaseModel.findAll({where : {status:true, deleted_at:null}})

      if (database.length === 0){
        return {"message":"no se encontraron registros", "code":2, "data":null}
      }

      return {"message":"lista de databases", "code":1, "data":database}

    }catch(error){

      return {"message":"no se pudo consultar database", "code":2, "data":null}
    }
  }
  
  async findOne(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = await this.DatabaseModel.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de database", "code":1, "data":database}
      
    }catch(error){

      return {"message":"no se pudo crear database", "code":2, "data":null}

    }
  }

  async update(@Param('id', ParseUUIDPipe) id:string, updateDatabaseDto: UpdateDatabaseDto) {
    try{

      const database = await this.DatabaseModel.update(updateDatabaseDto ,{where : {id: id}});
      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      const data = await this.DatabaseModel.findOne({where : {id: id, deleted_at:null}})

      return {"message":"database actualizada correctamente", "code":1, "data":data}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar database", "code":2, "data":null}
    }
  }
  
  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = this.DatabaseModel.findOne({where : {id: id, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      await this.DatabaseModel.destroy({where : {id: id, deleted_at:null}})

      return {"message":"registro eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar database", "code":2, "data":null}
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
      const database = await this.MigrateModel.create({...createMigrateLogDto});

      return {"message":"database creada correctamente", "code":1, "data":database}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear database", "code":2, "data":null}
    }
  }

  async findAll() {
    try{

      const database = await this.MigrateModel.findAll({where : {status:true, deleted_at:null}})

      if (database.length === 0){
        return {"message":"no se encontraron registros", "code":2, "data":null}
      }

      return {"message":"lista de databases", "code":1, "data":database}

    }catch(error){

      return {"message":"no se pudo consultar database", "code":2, "data":null}
    }
  }
  
  async findOne(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = await this.MigrateModel.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de database", "code":1, "data":database}
      
    }catch(error){

      throw new InternalServerErrorException("No se pudo crear el objeto", error)

    }
  }

  async update(@Param('id', ParseUUIDPipe) id:string, updateMigrateLogDto: CreateMigrateLogDto) {
    try{

      const database = await this.MigrateModel.update(updateMigrateLogDto ,{where : {id: id}});
      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      const data = await this.MigrateModel.findOne({where : {id: id, deleted_at:null}})

      return {"message":"database actualizada correctamente", "code":1, "data":data}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar database", "code":2, "data":null}
    }
  }
  
  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = this.MigrateModel.findOne({where : {id: id, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      await this.MigrateModel.destroy({where : {id: id, deleted_at:null}})

      return {"message":"registro eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar database", "code":2, "data":null}
    }
  }
}
