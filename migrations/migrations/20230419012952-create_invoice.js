'use strict';

/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up (queryInterface, Sequelize) {
    return queryInterface.createTable('Invoices', {
      id: {
        type: Sequelize.INTEGER,
        allowNull: false,
        autoIncrement: true,
        unique: true,
        primaryKey: true,
      },
      InvoiceId: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      CustomerId: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      CustomerName: {
        type: 'VARCHAR(50)',
        allowNull: false
      },
      BillingCity: {
        type: 'VARCHAR(50)',
        allowNull: false
      },
      BillingCountry: {
        type: 'VARCHAR(50)',
        allowNull: false
      },
      BillingAddress: {
        type: Sequelize.TEXT,
        allowNull: false
      },
      InvoiceTax: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      InvoiceTotal: {
        type: Sequelize.FLOAT,
        allowNull: false
      },
      InvoiceProductQuantity: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      InvoiceDate: {
        type: Sequelize.DATE,
        allowNull: false
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
      },
    });
  },

  async down (queryInterface, Sequelize) {
    return queryInterface.dropTable('Invoices');
  }
};
