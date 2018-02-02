import sys
import subprocess
import re


# Calls the R system specifying that commands come from file commands.R
# The commands.R provided with this assignment will read the file named
# data and will output a histogram of that data to the file pageshist.pdf
def runR():
	res = subprocess.call(['R', '-f', 'commands.R'])


# log2hist analyzes a log file to calculate the total number of pages
# printed by each user during the period represented by this log file,
# and uses R to produce a pdf file pageshist.pdf showing a histogram
# of these totals.  logfilename is a string which is the name of the
# log file to analyze.
#
def log2hist(logfilename):
	log = open(logfilename)
	users = {}

	for line in log:
		userRE = re.search('(user:\s+)(.+?)(\s+)', line)
		if userRE is not None:
			pagesRE = re.search('(pages:\s+)(.+?)(\s+)', line)
			if pagesRE is not None:
				userName = userRE.group(2)
				pagesNum = int(pagesRE.group(2))

				if userName not in users:
					users[userName] = pagesNum
				else:
					users[userName] += pagesNum
	print users
	data = open('data', 'w+')
	for pagesNum in users.values():
		data.write(str(pagesNum) + '\n')

	data.close()
	runR()
	return


if __name__ == '__main__':
	log2hist(sys.argv[1])
