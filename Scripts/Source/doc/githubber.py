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

property_toc = []
global_toc = []
member_toc = []

property_body = []
global_body = []
member_body = []

first_header = True
def parse_entry(entry):
	global first_header
	#Is this a Global, a Member, or a Property?
	is_global = False
	is_member = False
	is_property = False
	if any(') global' in line for line in entry):
	    is_global = True
	elif any('property' in line for line in entry):
		is_property = True
	else:
		is_member = True

	if is_global:
		for line in entry:
			if line.startswith('#'):
				line = line.replace('### ', '').replace('\n', '')
				link_line = line.replace('/', '_').replace('\n', '')
				line_split = line.split('/')
				line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1] + '()'
				toc_line = link_line.split('_')[1]
				if not global_toc:
					global_toc.append('### Global Functions\n')
				global_toc.append('* [' + toc_line + '()](#' + link_line + ')\n')
				if not first_header:
				    global_body.append('***\n')
				else:
					first_header = False
				if not property_body:
					property_body.append('\n')
					property_body.append('## Global Functions\n')
				global_body.append(line)
			elif line.endswith("**\n"):
				if "DESCRIPTION" in line:
					continue
				elif "RETURN VALUE" in line:
					line = '**Return Value**\n'
				else:
				    line = line.replace('**', '').replace('.\n', '').capitalize()
				    line = '**' + line + '**\n'
				global_body.append(line)
			else:
				global_body.append(line)
	elif is_member:
		for line in entry:
			if line.startswith('#'):
				line = line.replace('### ', '').replace('\n', '')
				link_line = line.replace('/', '_').replace('\n', '')
				line_split = line.split('/')
				line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1] + '()'
				toc_line = link_line.split('_')[1]
				if not member_toc:
					member_toc.append('### Member Functions\n')
				member_toc.append('* [' + toc_line + '()](#' + link_line + ')\n')
				if not first_header:
				    member_body.append('***\n')
				else:
					first_header = False
				if not member_body:
					property_body.append('## Member Functions\n')
				member_body.append(line)
			elif line.endswith("**\n"):
				if "DESCRIPTION" in line:
					continue
				elif "RETURN VALUE" in line:
					line = '**Return Value**\n'
				else:
				    line = line.replace('**', '').replace('.\n', '').capitalize()
				    line = '**' + line + '**\n'
				member_body.append(line)
			else:
				member_body.append(line)
	elif is_property:
		for line in entry:
			if line.startswith('#'):
				line = line.replace('### ', '').replace('\n', '')
				link_line = line.replace('/', '_').replace('\n', '')
				line_split = line.split('/')
				line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1]
				toc_line = link_line.split('_')[1]
				if not property_toc:
					property_toc.append('### Properties\n')
				property_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
				if not first_header:
				    property_body.append('***\n')
				else:
					first_header = False
				if not property_body:
					property_body.append('## Properties\n')
				property_body.append(line)
			elif line.endswith("**\n"):
				if "DESCRIPTION" in line:
					continue
				elif "RETURN VALUE" in line:
					line = '**Return Value**\n'
				else:
				    line = line.replace('**', '').replace('.\n', '').capitalize()
				    line = '**' + line + '**\n'
				property_body.append(line)
			else:
				property_body.append(line)

entry = list()
entries = list()
for line in lines:
	if line.startswith('#'):
		entries.append(entry)
		entry = list()
		entry.append(line)
	else:
		entry.append(line)
else:
	entries.append(entry)

for e in entries:
	parse_entry(e)

with open(str(sys.argv[2]), "w") as myfile:
	for line in header:
		myfile.write(line)
	for line in property_toc:
		myfile.write(line)
	for line in global_toc:
		myfile.write(line)
	for line in member_toc:
		myfile.write(line)
	myfile.write('\n')
	myfile.write('\n')
	for line in property_body:
		myfile.write(line)
	for line in global_body:
		myfile.write(line)
	for line in member_body:
		myfile.write(line)