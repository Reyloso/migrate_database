import { validate } from "class-validator";
import { Column, CreateDateColumn, DeleteDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";

class ObjectJSON {
    table_name: string;
    fields_list: string[];
}
  
class ObjectJSONTransformer {
    to(value: ObjectJSON): Record<string, any> {
        return value;
    }
  
    from(value: Record<string, any>): ObjectJSON {
        const objectJSON = new ObjectJSON();
        objectJSON.table_name = value.table_name;
        objectJSON.fields_list = value.fields_list;

        validate(objectJSON).then((errors) => {
            if (errors.length > 0) {
                throw new Error(`Objeto JSON no válido: ${JSON.stringify(errors)}`);
            }
        });

        return objectJSON;
    }
}


@Entity()
export class Database {
    
    @PrimaryGeneratedColumn('uuid')
    id:string;

    @Column('varchar', {
    length: 100,
    nullable:false,
    })
    database_name:string
   
    @Column('varchar', {
    length: 30,
    nullable:false,
    })
    database_username:string

    @Column('varchar', {
    length: 50,
    nullable:false,
    })
    database_password:string
   
    @Column('varchar', {
    length: 80,
    nullable:false,
    })
    database_host:string

    @Column('numeric',{
        nullable:false,
    })
    database_port:Number

    @Column({
        type: 'json',
        nullable:false,
        transformer: new ObjectJSONTransformer(),
    })
    table_extraction_configuration_json:ObjectJSON 

    @Column('boolean',{
        nullable:false,
        default:true
    })
    status:Boolean

    @CreateDateColumn()
    created_at: Date;
    
    @UpdateDateColumn()
    updated_at: Date; 

    @DeleteDateColumn()
    deleted_at: Date;
}
