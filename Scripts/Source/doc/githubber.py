import sys

if not len(sys.argv) == 3:
	print "Usage: githubber.py <input-file> <output-file>"
	sys.exit()
else:
	pass

f = open('./output/' + sys.argv[1], 'r')
lines = f.readlines()

h = open('./headers/' + str(sys.argv[1]), 'r')
header = h.readlines()

first_header = True
toc = []
toc.append('### Functions\n')
body = []
#body.append('## Global Functions\n')
body.append('\n')
for line in lines:
	if line.endswith("**\n"):
		if "DESCRIPTION" in line:
			continue
		elif "RETURN VALUE" in line:
			line = '**Return Value**\n'
		else:
		    line = line.replace('**', '').replace('.\n', '').capitalize()
		    line = '**' + line + '**\n'
		body.append(line)
	elif line.startswith('#'):
		line = line.replace('### ', '').replace('\n', '')
		link_line = line.replace('/', '_').replace('\n', '')
		line_split = line.split('/')
		line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1] + '()\n'
		toc_line = link_line.split('_')[1]
		toc.append('* [' + toc_line + '()](#' + link_line + ')\n')
		if not first_header:
		    body.append('***\n')
		else:
			first_header = False
		body.append(line)
	else:
		body.append(line)

toc.append('\n')
toc.append('***')
toc.append('\n')

with open(str(sys.argv[2]), "w") as myfile:
	for line in header:
		myfile.write(line)

	for line in toc:
		myfile.write(line)

	for line in body:
		myfile.write(line)