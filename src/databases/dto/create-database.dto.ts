import { IsBoolean, IsDate, IsIn, IsJSON, IsNumber, IsOptional, IsPositive, IsString, IsUUID, MinLength } from "class-validator";

export class CreateDatabaseDto {

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

    @MinLength(1)
    extraction_query:string

    @IsDate()
    @IsOptional()
    updated_at?:Date

}


export class CreateMigrateLogDto {

    @IsJSON()
    database:JSON

    @IsDate()
    @IsOptional()
    created_at?:Date

}
