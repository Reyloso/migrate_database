'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.createTable('Databases', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        primaryKey: true,
      },
      database_engine: {
        type: 'VARCHAR(50)',
        allowNull: false
      },
      database_name: {
        type: 'VARCHAR(100)',
        allowNull: false
      },
      database_username: {
        type: 'VARCHAR(100)',
        allowNull: false
      },
      
      database_password: {
        type: 'VARCHAR(100)',
        allowNull: false
      },
      database_host: {
        type: 'VARCHAR(100)',
        allowNull: false
      },
      database_port: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      extraction_query: {
        type: Sequelize.TEXT,
        allowNull: false
      },
      status: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue:true
      },
      created_at: {
        type: Sequelize.DATE,
        allowNull: false
      },
      updated_at: {
        type: Sequelize.DATE,
        allowNull: true
      },
      deleted_at: {
        type: Sequelize.DATE,
        allowNull: true
      }
    });
  },

  async down (queryInterface, Sequelize) {
    /**
     * Add reverting commands here.
     *
     * Example:
     * await queryInterface.dropTable('users');
     */
    await queryInterface.dropTable('Databases');
  }
};
