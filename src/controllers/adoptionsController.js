
/* eslint-disable camelcase */
const adoption = require("../models").adoption;
const moment = require("moment");


exports.create = async (req, res) => {

	try {

		
		//? como obtengo las adopciones de una fundacion
		// req.body.id_fundacion = req.userSession.id_fundacion;
		req.body.id_empleado = req.userSession.id;
		req.body.fecha_estudio = moment(new Date()).format("YYYY-MM-DD");
		const result = await adoption.create(req.body);
		res.status(201).json({
			state: true,
			message: "La adopción se ha registrado con éxito",
			data: result.id_adopcion // id assigned
		});

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al registrar la adopción"
		});
	}
};

exports.delete = async (req, res) => {
	try {

		const result = await adoption.destroy({
			where: {
				id_adopcion: req.params["id"]
			},
			include:"tracking"

		});

		if (result === 1) {
			res.status(200).json({
				state: true,
				message: "La adopción se ha eliminado exitosamente"
			});
		} else {
			res.status(404).json({
				state: false,
				message: "La adopción no existe"
			});
		}

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al eliminar la adopción"
		});
	}
};

exports.get = async (req, res) => {
	try {
		const searchResult = await adoption.findByPk(req.params["id"]);

		if (searchResult) {
			res.status(200).json({
				state: true,
				message: "Resultados obtenidos",
				data: searchResult
			});
		} else {
			res.status(404).json({
				state: false,
				message: "La adopción no existe"
			});
		}

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al obtener la adopción"
		});
	}
};

exports.update = async (req, res) => {
	try {

		await adoption.update(req.body, {
			where: {
				id_adopcion: req.body.id_adopcion
			}
		});

		res.status(200).json({
			state: true,
			message: "Los datos de la adopción se han actualizado exitosamente"
		});


	} catch (error) {

		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al actualizar los datos de la adopción"
		});

	}
};
exports.list = async (req, res) => {

	try {
		const searchResult = await adoption.findAll({
			//? como listo las adopciones de una fundación
			where: {
				id_fundacion: req.userSession.id_fundacion
			}
		});

		if (searchResult.length !== 0) {

			res.status(200).json({
				state: true,
				message: "Resultados obtenidos",
				data: searchResult
			});
		} else {
			res.status(404).json({
				state: false,
				message: "No existen registros en la base de datos"

			});
		}

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al obtener la lista de la adopciones"
		});
	}
};
