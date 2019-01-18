# convert json to csv
import json
with open('conf_europe.json') as file:
    europe = json.load(file) #added a [] to conf_europe file to get json format

# for entry in europe:
#     if entry["region"] != "Europe":
#         europe.remove(entry)
#     print(entry["region"])

europe = [entry for entry in europe if entry["region"] == "Europe"]
print(len(europe))

#russia = [] 

#for entry in europe:
    #if entry["country"] == "Russia (Soviet Union)":
        #europe.index(entry)
        #europe.remove(entry)
        #russia.append(entry)
    
#print(europe)
#print(len(russia))

import csv

# header = []
# for entry in europe:
#     for key in entry.keys():
#         if key is not in header:
#             header.append(key)

# with open('conf_europe.csv', 'w',encoding='utf8') as file:
#     writer = csv.DictWriter(file, fieldnames=header, lineterminator='/n', delimiter=',')
#     writer.writeheader()
#     for entry in europe:
#         writer.writerow(entry)

header = ['country', 'region', 'year', 'latitude', 'longitude', 'type_of_violence', 'best']

with open('conf_europe2.csv','w',newline='') as file:
    filewriter = csv.writer(file)
    filewriter.writerow(header)
    for entry in europe:
        filewriter.writerow([entry["country"], entry["region"], entry["year"], entry['latitude'], entry['longitude'], entry["type_of_violence"], entry["best"]])
    # for each dictionary in the list of relevant datapoints  
        # to test, print the country, region, etc. for this dictionary
        # Find your country, region, etc. and use writerow([list,of,all,things,you,want,to,write])
