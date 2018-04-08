# gets median and average for each country
def hasNumbers(inputString):
    return any(char.isdigit() for char in inputString)


def getStats(file, country):
    country = country.lower()
    fp = open(file, 'r')
    listSum = 0
    counter = 0
    medianList = []
    for i in fp:
        i = i.strip().split(',')
        if i[0][1:-1].lower() == country:
            print(i)
            medianList.append(float(i[5][1:-1]))
            counter += 1
            listSum += float(i[5][1:-1])
    mid = findMiddle(medianList)
    return round(listSum/counter,1), mid

# finds the middle of the list for the purpose of finding the median
def findMiddle(x):
    mid = float(len(x))/2
    if mid%2 == 0:
        return (x[int(mid)]+x[int(mid-1)])/2
    else:
        return x[int(mid-.5)]

def main():
    file_name = "dataset.csv"
    fp = open(file_name,'r')
    target = file_name[:-4]+"_out.csv"
    t = open(target,'w')
    lines_read,lines_written = 0,0
    t.write('country,year,percentage,average across the years,median\n')
    
    for i in fp:
        current = i.strip().split(",")
        # print(current[0])
        if any(j.isdigit() for j in i) and not hasNumbers(current[0][1:-1]):
            #the [1:-1] indexes are the remove the quotation marks that the data entries come in
            average, median = getStats(file_name,current[0][1:-1])
            written = current[0][1:-1]+","+current[2][1:-1]+","+current[5][1:-1]+","+str(average)+","+str(median)+"\n"
            # print(written)
            t.write(written)



main()
