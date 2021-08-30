/* eslint-disable camelcase */
const post = require("../models").post;
const postImage = require("../models").postImage;
const fs = require("fs").promises;
const moment = require("moment");

exports.create = async (req, res) => {

	try {

		req.body.id_fundacion = req.userSession.id_fundacion;
		req.body.fecha_creacion = moment(new Date()).format("YYYY-MM-DD HH:mm:ss");
		const result = await post.create(req.body);
		res.status(201).json({
			state: true,
			message: "La publicación se ha creado con éxito",
			data: result.id_publicacion
		});

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al crear la publicación"
		});
	}
};


exports.uploadImages = async (req, res) => {

	let images = [];


	(req.files.postImages).forEach(element => {
		let image = {

			id_publicacion: req.body.id_publicacion,
			ruta: "images/postImages/" + element.filename

		};
		images.push(image);
	});

	try {
		await postImage.bulkCreate(images);

		res.status(201).json({
			state: true,
			message: "Las imagenes se han subido correctamente"
		});
	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al registrar las imágenes de la publicación"
		});
	}

};



exports.update = async (req, res) => {
	try {

		await post.update(req.body, {
			where: {
				id_publicacion: req.body.id_publicacion
			}
		});

		res.status(200).json({
			state: true,
			message: "Los datos de la publicación se han actualizado exitosamente"
		});

	} catch (error) {

		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al actualizar los datos de la publicación"
		});

	}
};
exports.get = async (req, res) => {

	try {
		const searchResult = await post.findByPk(req.params["id"]);

		if (searchResult) {


			res.status(200).json({
				state: true,
				message: "Resultados obtenidos",
				data: searchResult
			});
		} else {
			res.status(404).json({
				state: false,
				message: "La publicación no existe"

			});
		}

	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al obtener la publicación"
		});
	}

};

exports.list = async (req, res) => {


	try {
		const searchResult = await post.findAll({
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
			message: "Ha ocurrido un error al obtener la lista de publicaciones"
		});
	}
};


exports.delete = async (req, res) => {
	try {
		const searchResult = await post.findOne({
			where: {
				id_publicacion: req.params["id"]
			},
			include: "postImage"
		});


		if (searchResult) {


			(searchResult.postImage).forEach(async (element) => {
				await fs.unlink(`./src/public/${element.ruta}`);
			});

			const result = await searchResult.destroy();

			if (result) {
				res.status(200).json({
					state: true,
					message: "La publicación se ha eliminado exitosamente"
				});
			} else {
				res.status(404).json({
					state: false,
					message: "Error al eliminar la publicación",
					data: result
				});
			}
		} else {
			res.status(404).json({
				state: false,
				message: "La publicación no existe"
			});
		}
	} catch (error) {
		console.error(error);
		res.status(400).json({
			state: false,
			message: "Ha ocurrido un error al obtener la publicación"
		});
	}
};