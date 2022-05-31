from flask import Flask, render_template,request, jsonify
import pickle

#import model
filename = "logistic_regression.pkl"
with open(filename, 'rb') as file:
    model = pickle.load(file)
    print("Model loaded.......")


app = Flask(__name__)




@app.route('/',methods=['GET'])
def home():
    return render_template('hep.html')



@app.route('/result', methods = ['POST','GET'])
def result():
	if request.method == 'POST':
		to_predict_list = request.form.to_dict()
		to_predict_list = [ float(to_predict_list['age']), float(to_predict_list['sex']),
				float(to_predict_list['steroid']), float(to_predict_list['antivirals']),
				float(to_predict_list['fatigue']), float(to_predict_list['malaise']),
				float(to_predict_list['anorexia']),
				float(to_predict_list['liver_big']), float(to_predict_list['liver_firm']),
				float(to_predict_list['spleen_palable']), float(to_predict_list['spiders']),
				float(to_predict_list['ascites']), float(to_predict_list['varices']),
				float(to_predict_list['bilirubin']), float(to_predict_list['alk_phosphate']),
				float(to_predict_list['sgot']), float(to_predict_list['albumin']),
				float(to_predict_list['protime']) 
				]
		
		print(to_predict_list)

		#'age	sex	steroid	antivirals	fatigue	malaise	anorexia'
		#'liver_big	liver_firm	spleen_palable	spiders	ascites	varices	bilirubin	alk_phosphate	sgot	albumin	protime	'


		
		#result = model.predict([[30,2,1,2,2,2,2,1,2,2,2,2,1,1.0,85,18,4.0,61]])
		result = model.predict([to_predict_list])
		if int(result[0])== 1:
			prediction ='1'
		else:
			prediction ='0'		
		# return render_template("result.html", prediction)
		r = {"result": prediction}
		return jsonify(r)




if __name__ == '__main__':
    app.run(port=8080, debug=True)