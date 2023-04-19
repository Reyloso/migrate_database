import { IsDate, IsNumber, IsOptional, IsPositive, IsString, IsUUID, MinLength } from "class-validator";


export class CreateInvoiceDto {

    @IsUUID()
    @IsOptional()
    id?:string

    @IsNumber()
    @IsPositive()
    InvoiceId:Number

    @IsNumber()
    @IsPositive()
    CustomerId:Number

    @IsString()
    @MinLength(2)
    CustomerName:string

    @IsString()
    @MinLength(2)
    BillingCity:string

    @IsString()
    @MinLength(1)
    BillingCountry:string

    @IsString()
    @MinLength(1)
    BillingAddress:string

    @IsNumber()
    @IsPositive()
    InvoiceTax:Number

    @IsNumber()
    @IsPositive()
    InvoiceTotal:Number

    @IsNumber()
    @IsPositive()
    InvoiceProductQuantity:Number

    @IsDate()
    InvoiceDate:Date
}


