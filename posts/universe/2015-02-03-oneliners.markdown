---
title: One-liners (February 2015)
tags: howto
---

### Parse out links with grep

``` 
curl \
 http://media.ccc.de/.../...hd.rss | \
 grep -oE "<link>.*</link>" | grep -oE "http[^<]*"
```

Here we parse out links from [HD rss of Chaos Communication Congress](http://media.ccc.de/browse/congress/2014/broadcatching-mp4%20(hd).rss) 
and get the torrent link to downolad it with transmission or rtorrent.
If you are an asshole and don't want to use a torrent, you can just use [this mirror](http://mirror.netcologne.de/CCC/congress/2014/h264-hd/)
to get the videos. Consider putting up a mirror if you do so, to give back the traffic.

```
# Download CCC talks in English
m="http://mirror.netcologne.de/CCC/congress/2014/h264-hd"
for x in \
 $(curl $m \
  | grep -oE 'href="[^"]*"' \
  | grep -oE '31c3.*-en[^"]*'); do wget "$m/$x"
done
```
