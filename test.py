import os
from flask import Flask, request

app = Flask(__name__)

@app.route("/liveness", methods=['GET'])

def liveness():
    '''Checks app's liveness'''
    return 'OK'


@app.route('/', methods=['GET'])

def clock_countdown():
    return """
       <iframe src="http://free.timeanddate.com/countdown/i6k661sm/cf112/cm0/cu4/ct0/cs0/ca0/cr0/\
    	ss0/cac000/cpc000/pcf00/tcfc0/fs100/szw320/szh135/tatTime%20left%20to%20Event%20in/tac000/tptTime%20since%20Event%20started%20in/tpc000/mac000/\
    	mpc000/iso2018-12-25T00:00:00" allowTransparency="true" frameborder="0" width="320" height="135"></iframe>'
    	"""


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80, debug=False)
