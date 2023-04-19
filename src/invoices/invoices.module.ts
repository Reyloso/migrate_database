import { Module } from '@nestjs/common';
import { InvoicesService } from './invoices.service';
import { InvoicesController } from './invoices.controller';
import { Invoice } from './entities/invoice.entity';
import { SequelizeModule } from '@nestjs/sequelize';

@Module({
  controllers: [InvoicesController],
  providers: [InvoicesService],
  imports: [SequelizeModule.forFeature([Invoice])],
})
export class InvoicesModule {}
