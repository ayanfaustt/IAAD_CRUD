import db from '../database.js';
import sequelize from 'sequelize';


const Linguagem = db.define('linguagem_programação',{
    id_linguagem:{
        type: sequelize.INTEGER,
        allowNull:false,
        primaryKey: true

    },
    nome_linguagem:{
        type: sequelize.TEXT,
        allowNull:false,
    },
    ano_lancamento:{
        type: sequelize.INTEGER,
        allowNull:false,
    }
})


export default Linguagem;