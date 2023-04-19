
export interface DatabaseInterface {
  id?: string;

  database_engine: 'postgres' | 'mysql' | 'sqlite' | 'mssql';

  database_name: string;

  database_username: string;

  database_password: string;

  database_host: string;

  migration_destination_table_name: string;

  database_port: number;

  extraction_query: string;
}




