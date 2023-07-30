import math
import argparse
import datetime

parser = argparse.ArgumentParser()
parser.add_argument("-h","--latitude", type=int)
parser.add_argument("-w","--longitude", type=int)

args = parser.parse_args()
lat = args.latitude
lon = args.longitude

baseDate = 
vernalEquinox = 45005
summerSolstice = 45098
autumnalEquinox =  45192
winterSolstice = 45282
sigDates = [vernalEquinox,summerSolstice,autumnalEquinox,winterSolstice]
defaultLats = [0,30,60,90]

timezone = 0

if lon == None:
    lon = 0

def zenith_default():
    for x in defaultLats:
        for y in sigDates:
            zenith_calc(x,lon,y)

def zenith_calc(calcLat,calcLon,date):
    dateActual = datetime.fromordinal(datetime(1900, 1, 1).toordinal() + date - 2)
    print("calculating zenith info for " + calcLat + " lat, " + calcLon + " lon on " + dateActual)
    julianDay = date+2415018.5

if lat == None:
    print("calculating with default latitudes")
    zenith_default()
