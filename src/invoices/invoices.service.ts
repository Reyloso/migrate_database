import { Injectable, Param, ParseUUIDPipe, Query } from '@nestjs/common';
import { CreateInvoiceDto } from './dto/create-invoice.dto';
import { UpdateInvoiceDto } from './dto/update-invoice.dto';
import { Invoice } from './entities/invoice.entity';
import { InjectModel } from '@nestjs/sequelize';
import { Op } from 'sequelize';

@Injectable()
export class InvoicesService {

  constructor(
    @InjectModel(Invoice)
    private readonly InvoiceModel: typeof Invoice,

  ){}


  async create(createInvoiceDto: CreateInvoiceDto) {
    try{
      const invoice = await this.InvoiceModel.create({...createInvoiceDto});

      return {"message":"[invoice] creada correctamente", "code":1, "data":invoice}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo crear [invoice]", "code":2, "data":null}
    }
  }

  async findAll(@Query() query: any) {
    try{
      // paginacion y filtrado
      const { page, pageSize, date_start, date_end } = query;
      const limit = pageSize ? +pageSize : 10;
      const offset = page ? (page - 1) * limit : 0;
      const where: any = {};

      if (date_start && date_end) {
        where.created_at = {
          [Op.between]: [new Date(date_start), new Date(date_end)],
        };
      } else if (date_start) {
        where.createdAt = { [Op.gte]: new Date(date_start) };
      } else if (date_end) {
        where.createdAt = { [Op.lte]: new Date(date_end) };
      }

      const { rows, count } = await this.InvoiceModel.findAndCountAll({ limit, offset , where});

      const response = {
        data: rows,
        total: count,
        page,
        pageSize,
        totalPages: Math.ceil(count / limit),
        "message":"lista de [Invoices]",
        "code":1,
      };

      if (response.total === 0){
        return {"message":"no se encontraron [Invoices]", "code":2, "data":null}
      }

      return response

    }catch(error){

      return {"message":"no se pudo consultar [Invoice]", "code":2, "data":null}
    }
  }

  async findOne(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const invoice = await this.InvoiceModel.findOne({where : {id: id, status:true, deleted_at:null}})

      if ( !invoice )
        return {"message":`no se encontro una [Invoice] con el id ${id}`, "code":2, "data":null}

      return {"message":"detalle de database", "code":1, "data":invoice}
      
    }catch(error){

      return {"message":"no se pudo consultar [Invoice]", "code":2, "data":null}

    }
  }

  async update(id: number, updateInvoiceDto: UpdateInvoiceDto) {
    try{

      const invoice = await this.InvoiceModel.update(updateInvoiceDto ,{where : {id: id}});
      if ( !invoice )
        return {"message":`no se encontro una [Invoice] con el id ${id}`, "code":2, "data":null}

      const data = await this.InvoiceModel.findOne({where : {id: id, deleted_at:null}})

      return {"message":"[Invoice] actualizada correctamente", "code":1, "data":data}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo actualizar [Invoice]", "code":2, "data":null}
    }
  }

  async remove(@Param('id', ParseUUIDPipe) id:string) {
    try{

      const database = this.InvoiceModel.findOne({where : {id: id, deleted_at:null}})

      if ( !database )
        return {"message":`no se encontro una [Invoice] con el id ${id}`, "code":2, "data":null}

      await this.InvoiceModel.destroy({where : {id: id, deleted_at:null}})

      return {"message":"[Invoice] eliminado correctamente", "code":1, "data":null}

    }catch(error){

      console.log(error)

      return {"message":"no se pudo eliminar [Invoice]", "code":2, "data":null}
    }
  }
}
