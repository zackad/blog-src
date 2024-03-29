---
title: 'Scrapping Leaflet Marker Data'
date: 2022-09-27T14:53:12+07:00
lastmod: 2022-10-03T14:21:00+07:00
tags: [snippet]
---

This is a snippet to scrap data from leaflet map generated by `https://sekolah.data.kemdikbud.go.id/index.php/Cpetasebaran/index/000000/`

- Select data you want to scrap
  {{<figure src="/assets/images/select_data.png" caption="Figure 1: Select data to be scrapped">}}
- Open developer console on your browser and paste following code

```javascript
// Retrieve layers data as array
let layers = Object.keys(map._layers).map((key) => map._layers[key])

// Filter with popup only
let points = layers.filter((layer) => layer._popupHandlersAdded)

// Do something with the results
let results = points.map((point) => ({ coordinate: point.getLatLng(), data: point.getPopup().getContent() }))

// Extract essentials data
let processed = results.map((item) => {
  // Create dummy element for querying DOM
  const element = document.createElement('div')
  element.innerHTML = item.data
  const schoolId = element.querySelector('a').href.split('/').pop()
  let data = element.querySelectorAll('li')
  data = [...data].map((el) => {
    const result = el.textContent.replace('NPSN : ', '').replace('Alamat : ', '')
    return result
  })
  data.push(schoolId)

  return { coordinate: item.coordinate, npsn: data[0], nama: data[1], alamat: data[2], id: data[3] }
})

localStorage.setItem('results', JSON.stringify(processed))
```

- Now we can retrieve the results from `localStorage`. Open **Storage** tabs, navigate to _Local Storage_, select and copy
  {{<figure src="/assets/images/copy_localstorage.png" caption="Figure 2: Copy from localStorage">}}
- Paste into text editor and remove `result:"` at the start of the line and `"` from the end of the line. Save as `results.json` file.
- Create new file and paste following code, save as `json2geo.py`

```python
#!/usr/bin/env python3
# Original code from: https://gis.stackexchange.com/a/74046

from sys import argv
from os.path import exists
import simplejson as json

script, in_file, out_file = argv

data = json.load(open(in_file))

geojson = {
    "type": "FeatureCollection",
    "features": [
    {
        "type": "Feature",
        "geometry" : {
            "type": "Point",
            "coordinates": [d["coordinate"]["lng"], d["coordinate"]["lat"]],
            },
        "properties" : d,
     } for d in data]
}

output = open(out_file, 'w')
json.dump(geojson, output)
```

- Add execute permission with `chmod +x json2geo.py`
- Open terminal and run `./json2geo.py results.json final-results.geojson`
