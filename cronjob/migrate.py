import requests
import logging

class migrate:
    def __init__(self):
        self.logger = self.init_logger()
        self.url_base = 'http://localhost:3000/api'
        self.url_get_database = '/databases'
        self.url_post_migrate = '/migrate'

    def init_logger(self):
        """ funcion para guardar log """
        logger = logging.getLogger()
        
        logger.setLevel(logging.DEBUG)

        handler = logging.FileHandler('migratelog.log')

        handler.setLevel(logging.DEBUG)

        formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')

        handler.setFormatter(formatter)

        logger.addHandler(handler)

        return logger


    def get_databases(self):
        """ funcion para obtener las databases """
        
        logging.info('obteniendo database del api')

        response = requests.get(f"{self.url_base}{self.url_get_database}")

        if response.status_code == 200:

            logging.info('respuesta obtenida correctamente')
            data = response.json()

            return data
        else:

            logging.warning(F'respuesta fallida de la peticion get {response.status_code}')
            return None

    def post_migrate(self):
        """ funcion para llamar migracion por api """

        logging.info('obteniendo database del api')
        response = requests.post(f"{self.url_base}{self.url_post_migrate}/{key['id']}", data=None)

        if response.status_code == 201:

            logging.info('migracion ejecutada correctamente')

            data = response.json()

            logging.info(f'{data}')

            return data
        else:

            logging.warning(F'respuesta fallida de la peticion post {response.status_code}')
            return None

    def execute_migrate(self):
        logging.info('Ejecutando tarea de migracion')

        data = self.get_databases()

        if data is not None and data['code'] == 1 :

            databases_list = data['data']

            logging.info(f' lista de databases {databases_list}')
            logging.info(f' iterando lista de databases')

            for key in databases_list:

                logging.info(f"Ejecutando migracion para la database id: {key['id']}")

                self.post_migrate(key['id'])
                
                
if __name__ == '__main__':
    migrate = migrate()
    migrate.execute_migrate()  