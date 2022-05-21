import sequelize from 'sequelize';
import db from '../database.js'
import Startup from './Startup.js';
import Programador_Linguagem from './Programador_Linguagem.js';
import Linguagem from './Linguagem_Programacao.js';

const Programador = db.define('programador',{
    id_programador:{
        type: sequelize.INTEGER,
        allowNull: false,
        primaryKey: true
    },
    nome_programador:{
        type: sequelize.TEXT,
        allowNull: false,
    },
    genero:{
        type: sequelize.CHAR,
        allowNull: false
    },
    data_nascimento:{
        type: sequelize.DATE,
        allowNull: false,
    },
    email:{
        type: sequelize.TEXT,
        allowNull: false
    }

});


// relacionamento one to many
Programador.belongsTo(Startup,{
    constraint: true,
    foreignKey: 'id_startup'
});

Startup.hasMany(Programador, {
    foreignKey: 'id_startup'
});

//relacionamento many to many

Programador.belongsToMany(Linguagem,{
    through:{
        model: Programador_Linguagem
    },
    foreignKey: 'id_programador',
    constraint: true
});

Linguagem.belongsToMany(Programador,{
    through:{
        model: Programador_Linguagem
    },
    foreignKey: 'id_linguagem',
    constraint: true
})

export default Programador;