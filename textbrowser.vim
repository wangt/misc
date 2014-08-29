function! Yisee()

python << EOF
import urllib2,vim,json
TIMEOUT = 20
#URL = "http://reddit.com/.json"
url = vim.eval('@"')

if not url.startswith('http://www.yi-see.com'):
    url = 'http://www.yi-see.com/%s' % url

try:
    print 'loading..',
    response = urllib2.urlopen(url, None, TIMEOUT).read().decode('GBK').encode('utf-8')
    if url.find('art') != -1:
	    #del vim.current.buffer[:]
        for line in re.findall("<a href='read_\d+_\d+.html' >.*?</a>", response, re.M|re.I):
		vim.current.buffer.append(line)
    elif url.find('read') != -1:
    #del vim.current.buffer[:]
        for line in re.findall('<TD CLASS=ART>.*?</TD>', response, re.M|re.I|re.S):
	    for s in line.replace('<br>','\n').split('\n'):
    	        vim.current.buffer.append(s)
    else:
	for m in re.finditer("<a href='(.*?)'.*?>(.*?)</a>",response, re.I|re.M|re.S):
	    vim.current.buffer.append("%s\t%s" % (m.group(1), m.group(2)))

    print 'Done.',

except Exception, e:
    print e

EOF
endfunction
