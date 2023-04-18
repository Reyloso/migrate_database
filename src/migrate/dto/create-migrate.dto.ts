import { IsDate, IsJSON, IsOptional, IsUUID } from "class-validator";


export class CreateMigrateLogDto {

    @IsUUID()
    @IsOptional()
    id?:string

    @IsJSON()
    table_extraction_configuration_json:JSON

    @IsDate()
    @IsOptional()
    updated_at?:Date

    @IsDate()
    @IsOptional()
    deleted_at?:Date
}
