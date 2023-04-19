import { Column, Model, PrimaryKey, Table, Default, DataType, CreatedAt, UpdatedAt, DeletedAt  } from "sequelize-typescript";
import { v4 as uuid } from 'uuid';

@Table
export class Invoice extends Model {

    @PrimaryKey
    @Default(uuid)
    @Column({
        type: DataType.UUID,
        defaultValue: uuid,
    })
    id:string;

    @Column({
        type: DataType.INTEGER,
        allowNull:false,
    })
    InvoiceId:Number

    @Column({
        type: DataType.INTEGER,
        allowNull:false,
    })
    CustomerId:Number

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    CustomerName:string

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    BillingCity:string

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    BillingCountry:string

    @Column({
        type: DataType.TEXT,
        allowNull:false,
    })
    BillingAddress:string

    @Column({
        type: DataType.FLOAT,
        allowNull:false,
    })
    InvoiceTax:Number

    @Column({
        type: DataType.FLOAT,
        allowNull:false,
    })
    InvoiceTotal:Number

    @Column({
        type: DataType.INTEGER,
        allowNull:false,
    })
    InvoiceProductQuantity:Number

    @Column({
        allowNull:false,
    })
    InvoiceDate:Date

    @CreatedAt
    created_at: Date;
    
    @UpdatedAt
    updated_at: Date; 

    @DeletedAt
    deleted_at: Date;
}
