import { Sequelize } from 'sequelize';

const db = new Sequelize('db_penggajian3', 'root', 'sahil2000', {
    host: "localhost",
    dialect: "mysql"
});

export default db;