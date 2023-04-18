import { Column, CreateDateColumn, DeleteDateColumn, Entity, PrimaryGeneratedColumn, UpdateDateColumn } from "typeorm";


@Entity()
export class MigrateLog {
    
    @PrimaryGeneratedColumn('uuid')
    id:string;

    @Column({
        type: 'json',
        nullable:false,
    })
    table_extraction_configuration_json:JSON

    @CreateDateColumn()
    created_at: Date;
    
    @UpdateDateColumn()
    updated_at: Date; 

    @DeleteDateColumn()
    deleted_at: Date;

}
