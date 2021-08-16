/* eslint-disable camelcase */
"use strict";
const {
	Model
} = require("sequelize");
module.exports = (sequelize, DataTypes) => {
	class post extends Model {
		/**
		 * Helper method for defining associations.
		 * This method is not a part of Sequelize lifecycle.
		 * The `models/index` file will call this method automatically.
		 */
		static associate(models) {
			// define association here
		}
	}
	post.init({
		id_noticia: { primaryKey: true, allowNull: false, type: DataTypes.INTEGER, autoIncrement: true },
		id_fundacion: { allowNull: false, type: DataTypes.INTEGER },
		titulo: { type: DataTypes.STRING(200), allowNull: false },
		cuerpo: { type: DataTypes.TEXT, allowNull: false },
		fecha_creacion: { type: DataTypes.DATE, allowNull: false }
	}, {
		sequelize,
		modelName: "post",
		tableName: "imagen_publicacion",
		timestamps: false
	});
	return post;
};