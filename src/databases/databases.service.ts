import { Delete, Injectable, InternalServerErrorException, Param, ParseUUIDPipe } from '@nestjs/common';
import { CreateDatabaseDto } from './dto/create-database.dto';
import { UpdateDatabaseDto } from './dto/update-database.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Database } from './entities/database.entity';
import { Repository } from 'typeorm';

@Injectable()
export class DatabasesService {

  constructor(

    @InjectRepository(Database)
    private readonly DatabaseRepository: Repository<Database>,

  ){}

  async create(createDatabaseDto: CreateDatabaseDto) {
    try{

      const database = this.DatabaseRepository.create(createDatabaseDto);

      await this.DatabaseRepository.save(database)

      return {"message":"database creada correctamente", "code":1, "data":database}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear database", "code":2, "data":null}
    }
  }

  async findAll() {
    try{

      const database = await this.DatabaseRepository.find({where : {status:true, deleted_at:null}})

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

      const database = await this.DatabaseRepository.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de database", "code":1, "data":database}
      
    }catch(error){

      throw new InternalServerErrorException("No se pudo crear el objeto", error)

    }
  }


  async update(@Param('id', ParseUUIDPipe) id:string, updateDatabaseDto: UpdateDatabaseDto) {
    try{

      const database = await this.DatabaseRepository.update(id, updateDatabaseDto);
      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      return {"message":"database actualizada correctamente", "code":1, "data":database}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar database", "code":2, "data":null}
    }
  }
  
  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = this.DatabaseRepository.findOne({where : {id: id, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una database con el id ${id}`, "code":2, "data":null}

      await this.DatabaseRepository.softDelete(id)

      return {"message":"registro eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar database", "code":2, "data":null}
    }
  }
}
