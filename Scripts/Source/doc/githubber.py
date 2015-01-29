import sys

if not len(sys.argv) == 3:
	print "Usage: githubber.py <input-file> <output-file>"
	sys.exit()
else:
	pass

header = []

parent_prop_toc = []
parent_mem_toc = []
parent_glob_toc = []
parent_props = []
parent_mems = []
parent_globs = []

property_toc = []
global_toc = []
member_toc = []
property_body = []
global_body = []
member_body = []
parent_line = ''

first_header = True
def main(file_to_parse, child=False):
	try:
		f = open('./output/' + file_to_parse, 'r')
	except IOError:
		return
	lines = f.readlines()
	last_child_header_index = 0
	last_header_index = 0
	
	def parse_entry(entry):
		global first_header
		global parent_line
		global parent_prop_toc
		global parent_mem_toc
		global parent_glob_toc
		global parent_props
		global parent_mems
		global parent_globs
		global property_toc
		global global_toc
		global member_toc
		global property_body
		global global_body
		global member_body
		global header
		#Is this a Global, a Member, or a Property?
		is_global = False
		is_member = False
		is_property = False
		is_scriptname = False
		if any(') global' in line for line in entry):
		    is_global = True
		elif any('property' in line for line in entry):
			is_property = True
		elif any('scriptname' in line for line in entry):
			is_scriptname = True
		else:
			is_member = True
	
		if is_global:
			for line in entry:
				if '\_' in line:
					line = line.replace('\_', '_')
				if '}' in line:
					line = line.replace('}', '')
				if line.startswith('#'):
					line = line.replace('### ', '').replace('\n', '')
					link_line = line.replace('/', '_').replace('\n', '')
					line_split = line.split('/')
					line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1]
					toc_line = link_line.split('_', 1)[1]
					if child:
						if not parent_glob_toc:
							parent_glob_toc.append('#### Inherited Global Functions\n')
						parent_glob_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
					else:
						if not global_toc:
							global_toc.append('#### Global Functions\n')
						global_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
					if not first_header:
						if child:
							parent_globs.append('***\n')
						else:
							global_body.append('***\n')
					else:
						first_header = False
					if child:
						if len(parent_globs) <= 1:
							parent_globs.append('\n')
							parent_globs.append('### Inherited Global Functions\n')
						parent_globs.append(line)
					else:
						if len(global_body) <= 1:
							global_body.append('\n')
							global_body.append('### Global Functions\n')
						global_body.append(line)		
						
				elif line.endswith("**\n"):
					if "DESCRIPTION" in line:
						continue
					elif "RETURN VALUE" in line:
						line = '**Return Value**\n'
					else:
					    line = line.replace('**', '').replace('.\n', '').capitalize()
					    line = '**' + line + '**\n'
					if child:
						parent_globs.append(line)
					else:
						global_body.append(line)
				else:
					if child:
						parent_globs.append(line)
					else:
						global_body.append(line)
		elif is_member:
			for line in entry:
				if '\_' in line:
					line = line.replace('\_', '_')
				if '}' in line:
					line = line.replace('}', '')
				if line.startswith('#'):
					line = line.replace('### ', '').replace('\n', '')
					link_line = line.replace('/', '_').replace('\n', '')
					line_split = line.split('/')
					line = '#### <a name=\"' + link_line + '\"></a>' + line_split[1]
					toc_line = link_line.split('_', 1)[1]
					if child:
						if not parent_mem_toc:
							parent_mem_toc.append('#### Inherited Member Functions\n')	
						parent_mem_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
					else:
						if not member_toc:
							member_toc.append('#### Member Functions\n')
						member_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
					if not first_header:
						if child:
							parent_mems.append('***\n')
						else:
							member_body.append('***\n')
					else:
						first_header = False
					if child:
						if len(parent_mems) <= 1:
							parent_mems.append('### Inherited Member Functions\n')
						parent_mems.append(line)
					else:
						if len(member_body) <= 1:
							member_body.append('### Member Functions\n')
						member_body.append(line)

				elif line.endswith("**\n"):
					if "DESCRIPTION" in line:
						continue
					elif "RETURN VALUE" in line:
						line = '**Return Value**\n'
					else:
					    line = line.replace('**', '').replace('.\n', '').capitalize()
					    line = '**' + line + '**\n'
					if child:
						parent_mems.append(line)
					else:
						member_body.append(line)
				else:
					if child:
						parent_mems.append(line)
					else:
						member_body.append(line)
		elif is_property:
			for line in entry:
				if '\_' in line:
					line = line.replace('\_', '_')
				if '}' in line:
					line = line.replace('}', '')
				if line.startswith('#'):
					line = line.replace('### ', '').replace('\n', '')
					link_line = line.replace('/', '_').replace('\n', '')
					line_split = line.split('/')
					line = '##### <a name=\"' + link_line + '\"></a>' + line_split[1]
					toc_line = link_line.split('_', 1)[1]
					if child:
						if not parent_prop_toc:
							parent_prop_toc.append('#### Inherited Properties\n')
						parent_prop_toc.append('* [' + toc_line + '](#' + link_line + ')\n')
					else:
						if not property_toc:
							property_toc.append('#### Properties\n')
						property_toc.append('* [' + toc_line + '](#' + link_line + ')\n')

					if not first_header:
						if child:
							parent_props.append('***\n')
						else:
							property_body.append('***\n')
					else:
						first_header = False
					if child:
						if len(parent_props) <= 1:
							parent_props.append('### Inherited Properties\n')
						parent_props.append(line)
						last_child_header_index = len(parent_props) - 1
					else:
						if len(property_body) <= 1:
							property_body.append('### Properties\n')
						property_body.append(line)
						last_header_index = len(property_body) - 1
				elif line.endswith("**\n"):
					if "DESCRIPTION" in line:
						continue
					elif "SYNTAX" in line:
						continue
					elif "RETURN VALUE" in line:
						line = '**Return Value**\n'
					else:
						line = line.replace('**', '').replace('.\n', '').capitalize()
						line = '**' + line + '**\n'
					if child:
						parent_props.append(line)
					else:
						property_body.append(line)
				elif line.endswith("auto\n"):
					type_line = line.split(' ')[4]
					if child:
						temp_header = parent_props[last_child_header_index].split('</a>')
					else:
						temp_header = property_body[last_header_index].split('</a>')
					new_header = temp_header[0]+ '</a>`' + type_line + '` ' + temp_header[1]
					if child:
						parent_props[last_child_header_index] = new_header
					else:
						property_body[last_header_index] = new_header
				else:
					if child:
						parent_props.append(line)
					else:
						property_body.append(line)
				
		elif is_scriptname:
			for line in entry:
				if 'extends' in line:
					parent = line.split()[3]
					if not parent_line:
						parent_line = '_Extends **' + parent + '**_\n'
					main(parent + '_psc.txt', True)
				elif "SCRIPTNAME" in line:
					continue
				elif "scriptname" in line:
					continue
				elif "OVERVIEW" in line:
					continue
				elif line.startswith('#'):
					continue
				else:
					if not child:
						line = line.replace("\\", "")
						header.append(line)

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

	if child:
		pass
	else:
		return parent_prop_toc, parent_mem_toc, parent_glob_toc, parent_props, parent_mems, parent_globs, property_toc, member_toc, global_toc, property_body, member_body, global_body

start_file = str(sys.argv[1])
ppt, pmt, pgt, pp, pm, pg, pt, mt, gt, p, m, g = main(start_file)

if header:
	header = [x for x in header if x != '\n']
if pgt and pg:
	pgt = [x for x in pgt if x != '\n']
	pgt.append('\n')
	pg.append('\n')
if gt and g:
	gt = [x for x in gt if x != '\n']
	gt.append('\n')
	g.append('\n')
if ppt and pp:
	ppt = [x for x in ppt if x != '\n']
	ppt.append('\n')
	pp.append('\n')
if pt and p:
	pt = [x for x in pt if x != '\n']
	pt.append('\n')
	p.append('\n')
if pmt and pm:
	pmt = [x for x in pmt if x != '\n']
	pmt.append('\n')
	pm.append('\n')	
if mt and m:
	mt = [x for x in mt if x != '\n']
	mt.append('\n')
	m.append('\n')

with open(str(sys.argv[2]), "w") as myfile:
	if parent_line:
		myfile.write(parent_line)
	myfile.write('## Overview\n')
	for line in header:
		myfile.write(line)
	myfile.write('\n')
	for line in pt:
		myfile.write(line)
	for line in ppt:
		myfile.write(line)
	for line in gt:
		myfile.write(line)
	for line in pgt:
		myfile.write(line)
	for line in mt:
		myfile.write(line)
	for line in pmt:
		myfile.write(line)
	for line in p:
		myfile.write(line)
	for line in pp:
		myfile.write(line)
	for line in g:
		myfile.write(line)
	for line in pg:
		myfile.write(line)
	for line in m:
		myfile.write(line)
	for line in pm:
		myfile.write(line)