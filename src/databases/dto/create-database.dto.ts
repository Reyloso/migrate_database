import { IsArray, IsBoolean, IsDate, IsIn, IsJSON, IsNumber, IsOptional, IsPositive, IsString, IsUUID, MinLength } from "class-validator";


class ObjectJSON {
    @IsString()
    @MinLength(1)
    table_name: string;

    @IsString({ each:true })
    @IsArray()
    fields_list: JSON;
}

export class CreateDatabaseDto {

    @IsUUID()
    @IsOptional()
    id?:string

    @IsIn(['postgres','mysql','sqlite','mssql'])
    @IsOptional()
    database_engine?:string

    @IsString()
    @MinLength(5)
    database_name:string

    @IsString()
    @MinLength(1)
    database_username:string

    @IsString()
    @MinLength(5)
    database_password:string

    @IsString()
    @MinLength(1)
    database_host:string

    @IsNumber()
    @IsPositive()
    database_port:Number

    @IsBoolean()
    @IsOptional()
    status?:Boolean

    @IsJSON()
    table_extraction_configuration_json:ObjectJSON

    @IsDate()
    @IsOptional()
    updated_at?:Date

    @IsDate()
    @IsOptional()
    deleted_at?:Date

}
