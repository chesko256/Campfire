import sys

if not len(sys.argv) == 2:
	print "You dun goofed"
	sys.exit()
else:
	pass

f = open(sys.argv[1], 'r')
lines = f.readlines()

toc = []
toc.append('## Overview\n')
toc.append('### Functions\n')
body = []
body.append('## Functions\n')
body.append('\n')
for line in lines:
	if line.endswith("**\n"):
		line = line.replace('**', '').replace('.\n', '').capitalize()
		line = '**' + line + '**\n'
		body.append(line)
	elif line.startswith('#'):
		line = line.replace('### ', '')
		link_line = line.replace('/', '_').replace('\n', '')
		line = '### <a name=\"' + link_line + '\"></a>' + line
		toc_line = link_line.split('_')[1]
		toc.append('* [' + toc_line + '](#' + link_line + ')\n')
		body.append('***\n')
		body.append(line)
	else:
		body.append(line)

toc.append('\n')
from pprint import pprint
pprint(toc)
pprint(body)

with open("output.txt", "w") as myfile:
	for line in toc:
		myfile.write(line)

	for line in body:
		myfile.write(line)