#!/bin/bash

# Script requires uglify-js v2 (https://github.com/mishoo/UglifyJS2)
#    npm install uglify-js -g
# Lives at: {PROJECT ROOT}/buildtools/optimize-js.sh
# Run from that directory (normally, called by build.sh in same directory)

now=$1
outpath=$2

# Main

echo -e "\033[1m\033[36mOptimizing for modern browsers: ${outpath}main.${now}.min.js\033[0m\033[0m"

[ -w ./start.js ] && rm ./start.js

touch ./start.js

echo "load_map_data(\"topojson\");" >> ./start.js

uglifyjs --prefix relative --output ${outpath}main.${now}.min.js --screw-ie8 --mangle --compress dead_code,loops,warnings,join_vars --reserved '$,L,map,window,data_obj' --stats --verbose -- ../assets/jquery-1.11.2/jquery.min.js ../assets/spin-2.1.0/spin.min.js ../assets/leaflet-0.7.3/js/leaflet.js ../assets/leaflet-0.7.3/js/Leaflet.vector-markers.js ../assets/leaflet-0.7.3/js/leaflet-providers.js ../assets/leaflet-0.7.3/js/leaflet-pip.min.js ../assets/leaflet-0.7.3/js/leaflet.spin.js ../assets/leaflet-0.7.3/js/leaflet.geojsoncss.min.js ../assets/leaflet-0.7.3/js/l.control.geosearch.js ../assets/leaflet-0.7.3/js/l.geosearch.provider.openstreetmap.js ../assets/leaflet-0.7.3/js/L.Control.Pan.js ../assets/leaflet-0.7.3/js/L.Control.ZoomBox.min.js ../assets/leaflet-0.7.3/js/leaflet.defaultextent.js ../assets/leaflet-0.7.3/js/leaflet.groupedlayercontrol.min.js ../assets/topojson-1.0/topojson.v1.min.js ../assets/leaflet-0.7.3/js/L.TopoJSON.min.js ../assets/main.js ../assets/CustomMarkers.js ./start.js
# --source-map ${outpath}main.${now}.min.js.map --source-map-root http://localhost:8000/assets --source-map-url

# IE 8

echo -e "\033[1m\033[36mOptimizing for IE8: ${outpath}main.ie8.min.js\033[0m\033[0m"

[ -w ./start-ie8.js ] && rm ./start-ie8.js

touch ./start-ie8.js

echo "load_map_data(\"geojson\");" >> ./start-ie8.js

uglifyjs --prefix relative --output ${outpath}main.ie8.${now}.min.js --mangle --compress dead_code,loops,warnings,join_vars --reserved '$,L,map,window,data_obj' --stats --verbose -- ../assets/ie8_polyfills.js ../assets/jquery-1.11.2/jquery.min.js ../assets/spin-2.1.0/spin.min.js ../assets/leaflet-0.7.3/js/leaflet.js ../assets/leaflet-0.7.3/js/Leaflet.vector-markers.js ../assets/leaflet-0.7.3/js/leaflet-providers.js ../assets/leaflet-0.7.3/js/leaflet-pip.min.js ../assets/leaflet-0.7.3/js/leaflet.spin.js ../assets/leaflet-0.7.3/js/leaflet.geojsoncss.min.js ../assets/leaflet-0.7.3/js/l.control.geosearch.js ../assets/leaflet-0.7.3/js/l.geosearch.provider.openstreetmap.js ../assets/leaflet-0.7.3/js/L.Control.Pan.js ../assets/leaflet-0.7.3/js/L.Control.ZoomBox.min.js ../assets/leaflet-0.7.3/js/leaflet.defaultextent.js ../assets/leaflet-0.7.3/js/leaflet.groupedlayercontrol.min.js ../assets/main.js ../assets/CustomMarkers.js ./start-ie8.js
# --source-map ${outpath}main.ie8.${now}.min.js.map --source-map-root http://localhost:8000/assets --source-map-url

# Datasets Credits

echo -e "\033[1m\033[36mOptimizing for Datasets Credits: ${outpath}datasets_credits.min.js\033[0m\033[0m"

uglifyjs --prefix relative --output ${outpath}datasets_credits.${now}.min.js --mangle --compress dead_code,loops,warnings,join_vars --reserved '$,window,data_obj' --stats --verbose -- ../assets/ie8_polyfills.js ../assets/jquery-1.11.2/jquery.min.js ../assets/datasets_credits.js
# --source-map ${outpath}datasets_credits.${now}.min.js.map --source-map-root http://localhost:8000/assets --source-map-url
