mongoose = require 'mongoose'

mongoose.connect 'mongodb://localhost/db'

plusSchema = new mongoose.Schema({
	#_id: Object,
	plusId: String,
	info: String
});
mongoose.model 'plus', plusSchema
module.exports.plus = mongoose.model 'plus'

# scumbag, no disconnect

