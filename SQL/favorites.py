import csv

#titles = [] #make an empty list to store the duplicates
#titles = set()
titles = {}     #empty dictionary

with open("favorites.csv", "r") as file:
    #reader = csv.reader(file)
    reader = csv.DictReader(file)
    #next(reader)
    for row in reader:
        title = row["title"].strip().upper()
        #print(row[1])
        #print(row["title"])
        #if not row["title"] in titles:
        #if not title in titles:
            #titles.append(row["title"])
            #titles.append(title)
        #titles.add(title)
        #if title in titles:
        #    titles[title] += 1
        #else:
        #    titles[title] = 0
        if not title in titles:
            titles[title] = 0
        titles[title] += 1

#def get_value(title):
#    return titles[title]

#for title in titles:
for title in sorted(titles, key=lambda title: titles[title], reverse=True):
    print(title, titles[title])
