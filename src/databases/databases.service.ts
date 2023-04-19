import { Injectable, InternalServerErrorException, Param, ParseUUIDPipe } from '@nestjs/common';
import { CreateDatabaseDto, CreateMigrateLogDto } from './dto/create-database.dto';
import { UpdateDatabaseDto, UpdateMigrateLogDto } from './dto/update-database.dto';
import { Database, Migratelog } from './entities/database.entity';
import { Invoice } from 'src/invoices/entities/invoice.entity';
import { InjectModel } from '@nestjs/sequelize';
import { Sequelize } from 'sequelize';
import { Dialect } from 'sequelize/types';


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
    @InjectModel(Database)
    private readonly DatabaseModel: typeof Database,
  ){}

  async create(@Param('id_database', ParseUUIDPipe) id:string) {
    try{
      
      // consultando database en la base de datos
      const database = await this.DatabaseModel.findOne({where : {id: id, status:true, deleted_at:null}})

      // validando si existe el registro
      if(!database)
        return {"message":`no se encontro una [Databse] con el id ${id} para realizar esta migracion`, "code":2, "data":null}

      let result = []

      // instanciando una conexion con las configuraciones dinamicas que viene del modelo
      const sequelize_conection = new Sequelize(
        `${database.database_name}`,
         `${database.database_username}`,
         `${database.database_password}`, {
        host: `${database.database_host}`,
        dialect: `${database.database_engine}` as Dialect
      });
      
      // ejecutando query de forma dinamica
      const cursor = await sequelize_conection.query(database.extraction_query).then(([results, metadata]) => {
        console.log("result ", results)
        result =results
      }).catch(error => {
        console.error('Error executing query:', error);
        return {"message":`ha ocurrido un error al ejecutar el query: ${error} `, "code":2, "data":null}
      });;

      // vaciando la tabla invoice para insertar los nuevos registros
      await Invoice.destroy({where: {}, truncate: true})

      // insertando nueva data 
      const invoices = await Invoice.bulkCreate(result)

      // se retorna el resultado
      return {"message":`Migracion Ejecutada Correctamente`, "code":1, "data":invoices}

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
}
