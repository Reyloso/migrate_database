import { Injectable } from '@nestjs/common';
import { Model } from 'sequelize';
import { Op } from 'sequelize';

@Injectable()
export class PaginationService {
  async findAll(model: any, page: number, pageSize: number, fromDate?: Date, toDate?: Date, message?:string, code?:number): Promise<any> {
    const limit = pageSize ? +pageSize : 10;
    const offset = page ? (page - 1) * limit : 0;
    const where: any = {};

    if (fromDate && toDate) {
      where.createdAt = {
        [Op.between]: [fromDate, toDate],
      };
    } else if (fromDate) {
      where.createdAt = { [Op.gte]: fromDate };
    } else if (toDate) {
      where.createdAt = { [Op.lte]: toDate };
    }

    const { rows, count } = await model.findAndCountAll({ limit, offset, where });

    return {
        message,
        code,
        data: rows,
        total: count,
        page,
        pageSize,
        totalPages: Math.ceil(count / limit),
    };
  }
}