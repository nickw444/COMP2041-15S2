import glob
g = glob.glob('./*.c')
print(g)
for f in g:
    with open(f) as filehandle:
        print(filehandle.read())
