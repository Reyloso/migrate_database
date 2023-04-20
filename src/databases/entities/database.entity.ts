import { Column, Model, PrimaryKey, Table, Default, DataType, CreatedAt, UpdatedAt, DeletedAt  } from "sequelize-typescript";
import { v4 as uuid } from 'uuid';

@Table
export class Database extends Model {
    

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    database_engine:string

    @Column({
        type: 'VARCHAR(100)',
        allowNull:false,
    })
    database_name:string

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    database_username:string

    @Column({
        type: 'VARCHAR(85)',
        allowNull:false,
    })
    database_password:string

    @Column({
        type: 'VARCHAR(50)',
        allowNull:false,
    })
    database_host:string

    @Column({
        type: DataType.INTEGER,
        allowNull:false,
    })
    database_port:Number

    @Column({
        type: DataType.TEXT,
        allowNull:false
    })
    extraction_query:string 

    @Column({ defaultValue: true})
    status:Boolean

    @CreatedAt
    created_at: Date;
    
    @UpdatedAt
    updated_at: Date; 

    @DeletedAt
    deleted_at: Date;
}


@Table
export class Migratelog extends Model {

    @Column({
        type: DataType.JSON,
        allowNull:false,
    })
    database:JSON

    @CreatedAt
    created_at: Date;

}
