import db from '../database.js';
import sequelize from 'sequelize';



const Startup = db.define('startup',{
    id_startup:{
        type: sequelize.INTEGER,
        allowNull:false,
        primaryKey: true

    },
    nome_startup:{
        type: sequelize.TEXT,
        allowNull:false,
    },
    cidade_sede:{
        type: sequelize.TEXT,
        allowNull:false,
    }
})


export default Startup;