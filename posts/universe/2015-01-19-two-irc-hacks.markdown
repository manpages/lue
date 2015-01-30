---
title: Two IRC Hacks
tags: howto, short
---

This is a short post revealing two little-known facts about two IRC-networks.

### Find a channel about a particular topic on an IRC network

So, let's say you need to find a channel on a large IRC network.

Turns out that on freenode, you can use convenient bot called 
Alis.

Let's say, you want to find a channel about My Little Pony on freenode:

```
/msg alis list *pon* -min 10
/msg alis list *mlp* -min 10
```

where ``-min 10`` means “has at least 10 users right now” and the rest
is self-explanatory.

For an arbitrary large network that doesn't have awesome bots, 
we can use an expect-script to ``/LIST`` it and then grep the output. 
We will use telnet, so we'd like that network to operate in plain text mode.

Here's my script:

```
#!/usr/bin/env expect

set ircNet  [lindex $argv 0]
set ircPort [lindex $argv 1]
set nick    "thelistbot"
set user    "list 8 * : List Bot"

spawn telnet $ircNet $ircPort

sleep 3
send "NICK $nick\r\n"
sleep 1
send "USER $user\r\n"
sleep 1
send "LIST\r\n"

interact
```

then 
```
ircNet="irc.oftc.net"
listIrc $ircNet 6667 | tee $ircNet.list
grep \#tor $ircNet.list
```

One must realize that ``interact`` statement and sleep
timings in my script are pretty arbitrary. The script,
however, does what it should for most connections and most
IRC servers.

### Gitter IRC backend

Turns out, ung-dly service “[gitter](https://gitter.im)” has IRC backend.
Still, it's pretty awful: it drops messages when another client is connected
to gitter with the same credentials, however it sorta works.

[Here](https://irc.gitter.im/) you can get instructions, written in ugly-backlit
neon font.

<a name="gitter-update">Updated on January 29, 2015</a>

as it turns out, as for now Gitter's IRC backend is beyond
unusable. Unlike in-browser client, this backend doesn't
shuffle messages randomly, neither have we observed it
assigning authorship of a message to a wrong user. However,
for large and active rooms, IRC backend proven to start
dropping messages (not showing those at all) with no
obvious pattern. And it doesn't have anything to do with
poor, if not lacking, multisession support of Gitter,
problem persists even when we're sure that no other sessions
of the same user are initialized. I wouldn't recommend using
gitter for anything serious. (*Cough*, [hello,
webpack](https://gitter.im/webpack/webpack)
*cough*).
