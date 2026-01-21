---
title: "What if the internet goes down? Introduction to LoRa mesh network communication with Meshcore"
description: "Outages, centralization, and repression are growing risks to worker organizing. In this article, tech worker Mar discusses how workers can stay connected even when the internet goes down, using LoRa mesh network communication with Meshcore software."
showSummary: true
author: "Mar"
date: 2026-01-21T07:00:00+02:00
lastmod: "2026-01-21"
tags: ["meshcore", "communication"]
feature: feature.jpg
featureAlt: "Calle Larga in a power cut at night in Cuenca, Ecuador, during the 2009 Ecuador electricity crisis."
---

Last week the [power went out in Amsterdam](https://www.parool.nl/amsterdam/stroomstoring-legt-grote-delen-van-amsterdam-anderhalf-uur-plat-trams-stil-winkels-dicht-musea-ontruimd~bea6c508/). Only for a few hours, mind. But long enough to cause some serious disruption. A power cut immediately affects your home wifi, as your router no longer works. Mobile GSM networks tend to have a backup battery, so may last a few hours longer. But if the power outage persists, eventually everything shuts down. 

Even if you’ve got power, your favourite internet service can go down. In October 2025 the messaging app [Signal was offline](https://www.techradar.com/vpn/vpn-privacy-security/we-need-to-go-beyond-signal-how-todays-aws-outage-shows-the-weaknesses-of-centralized-apps) due to a problem with Amazon Web Services. [Cloudflare](https://blog.cloudflare.com/18-november-2025-outage/) [outages](https://blog.cloudflare.com/5-december-2025-outage/) have repeatedly dragged down large parts of the internet. Are vibe coders pushing AI-slop straight to `main`? Is the internet generally getting shittier? Or is it just some bad luck? Whatever the cause, the centralisation you see in many parts of the internet poses a big risk.

And let’s not forget authoritarian repression, on the increase in Europe as well. Governments and militaries are often able to switch off the internet and mobile phone networks as they please. For example, the Israeli occupation in Palestine [regularly shuts down communication infrastructure in Gaza](https://7amleh.org/post/total-internet-blackout-expands-across-gaza,-threatening-complete-telecommunications-collapse), trying to thwart the indigenous population’s self-organisation, or to prevent journalists from reporting on genocidal crimes that occupation forces commit. 

As societies buckle under the effects of environmental change and capitalism, the question is when, not if, workers need to be ready to communicate and organise without the Internet.

## The problem: How to stay in touch without the internet

The issue that I, together with comrades from Techwerkers and Extinction Rebellion - Justice Now!, confronted was: When the internet goes down, how can people stay in touch with one another? How could a community of hundreds of comrades scattered around the Netherlands keep operating?

## The goal: Communication backup

Some form of backup communication infrastructure would have to be in place before the internet or phone networks would go down. That way, people would already know what to do and be comfortable switching to the alternative channels once the need would arise. The aim of the pilot group would be to try out this new system.

## The requirements

What functionality would the group really need to preserve? Of course, the backup system would need to work even without the internet or phone services. In addition, the group had some specific requirements.

### Medium distances

Techwerkers has affiliated workers across the Netherlands’ mainland, including from Groningen to Utrecht, Amsterdam, The Hague, and Eindhoven. Hence the system needed to reach further than the next street, but didn’t yet need to be able to reach Dakar or Ürümqi. Something that would cover distances between 0 and 500 km would do for now.

### Decentralized

As the Signal outage confirmed, having a single, central point of failure wasn’t an option. Such a setup could take down the entire communication system. Hence the backup would have to be a decentralized communication network.

Type of network | Description | Example
-- | -- | --
Centralized | A network in which a single element facilitates connections to all the nodes in the network. | Communication with Signal (as with WhatsApp, Instagram, Zoom) is centralized, because all traffic must pass through Signal’s servers to reach its destination.
Decentralized | A network in which multiple nodes connect to multiple other nodes, without there being a single node that facilitates all those connections. | Dutch air raid sirens form a decentralized communication network, in which each siren can communicate directly with other sirens and control nodes to receive updates or instructions to sound the alarm.

![Two networks. On the left a centralized network with all connections facilitated by a single node; on the right a decentralized one, with many nodes connecting to many other nodes.](centralized-decentralized.png)

### No special licensing

The solution shouldn’t require any special licensing. We can’t expect all workers to go through some formal exam process to be able to join in with the backup communication system. It should be relatively easy.  

### Comparatively inexpensive

The system had to be comparatively inexpensive, too. Again, people shouldn’t need to invest in expensive equipment just to be able to take part in the backup system. As many workers already use their phones to communicate through messaging apps, a solution that would stay close to that routine would be preferable. 

### Doesn’t rely on authorities

The solution mustn’t rely on official government services. People in the Netherlands tend to exhibit surprisingly high levels of obedience to authority. Emergencies often exacerbate such tendencies, pushing people even closer to state power. Perhaps understandably so, because the state often controls whatever infrastructure is still working. But, as past centuries have shown, within a capitalist system, state power serves the interests of businesses and rich people, while keeping regular workers exploited. 

You don’t want people to grow sympathy for state powers. Hence, controlling your own communication networks allows you to stay more autonomous in emergency situations.

With the challenge now clearly defined, the pilot group went on to look for the right solution.

## The solution: Mesh network communication with a LoRa board and Meshcore

The following options were considered, but ruled out:   

- **Walk over for a chat?** Fine when someone’s nearby, but it takes just too long if the people you want to reach are spread out across a country.
- **Bluetooth?** Pretty much all phones have it, and there’s software for setting up peer-to-peer bluetooth connections. But the range is too limited; typically a couple of metres at best.
- **Postcards?** Still rather slow. Besides, you’d have to rely on some increasingly shitty privatised company, at least in this country.
- **Amateur (HAM) radio?** Radio is fast and allows for long-distance communication. But you’d need a licence and expensive equipment to get a good range. 
- **Carrier pigeons?** Last time I checked they’d unionised, and now refuse to work for humans. Good on them.

The pilot group discovered something that would meet its core requirements: mesh network communication, using relatively cheap LoRa boards and Meshcore software.

### What is mesh network communication?

Mesh network communication is a form of communication that uses a mesh network. A mesh network is a decentralised type of network, where every node can directly connect to every other node, without requiring a third-party to facilitate the connection. But in a mesh-network, many nodes can work together to make extended chains of connection, so that two nodes far apart can connect indirectly. 

When you use a mesh network for communication, you can send a message into the network, where it will get broadcast by other nodes towards yet further nodes, forming a chain of broadcasts until the message reaches its destination. Messages ‘hop’ from one node to the next, so to say. This way, even if your device and my device are out of reach of each other, there could be a chain of other devices part of the mesh network that allows a message to be passed on from you to me. 

The advantage of mesh communication is that if a device drops away, some other device could take over and still create a path between you and the person you’re trying to reach.  There’s redundancy built in, and that protects the network against calamities, sabotage etc.  

Okay, so can you make use of the benefits of mesh communication yourself? Enter LoRa.

### What is LoRa?

LoRa is a radio communication technology designed for low-powered, long-range communication between devices. LoRa was developed in 2009 by a French company called Cycleo. ‘LoRa’ stands for Long Range. How long is long range? Practically, it tends to be something like 10 kilometers, so for example from Maastricht to Valkenburg. But if you have a clear line of sight between the devices you could reach over 300 kilometers. That’s from Maastricht all the way to Paris!

In Europe you’re allowed to use LoRa on the frequencies around 433 MhZ and 868 MhZ. Anyone can use these frequencies without a licence. But can you use LoRa radio to send text messages to each other as well? Yes you can! You just need some special software. 

#### Example: Surveillance electricity meter 

LoRa radio communication is already widely used by sensors and meters. In some countries the  electricity meters in people’s homes form a mesh communication network, passing on meter readings from meter to meter until they reach the electricity company. So, if you have such a surveillance meter (also called a ‘smart meter’) installed at home, chances are you’ve already got a LoRa device!

### What is Meshcore?

Meshcore is software that turns a simple LoRa radio transmitter into a messaging platform. You take such a radio transmitter, a [small single-board computer](#gear-used) you can get for around 15-30 euros. You install the Meshcore software on it. And then you connect to the board with your surveillance phone (also known as ‘smart phone’) using regular bluetooth. 

Now your little radio transmitter board is a node in the Meshcore mesh network. It can send and receive messages to other Meshcore nodes. You control it with your phone, which allows you to type and send messages, as well as read the messages you’ve received.  

## Experience so far

It’s with this Meshcore setup that we’ve been running a trial for the last two months.  With a fair bit of success. At least some of us are now able to message each other reliably using the mesh network. We’ve tried out direct communication in remote areas too, and also this works well. And because messages ‘hop’ from device to device until they reach the recipient, we’ve been able to send and receive some messages even from other countries already1 (With Meshcore the maximum number of hops is 64. Just to give you an idea of how far that will get you, it takes me around 20 hops to reach Belgium these days.) 

If you want to see for yourself, then you may want to use some of the tools we have used.

### Gear used

There’s many ways you can get started with mesh communication using LoRa transmitters. I will here just list what worked for us. Almost all of us ended up with the following setup: 

- **Board:** LoRa transmitter. Heltec Mesh Node T114. The board comes with an antenna. 
- **Software:** The Meshcore software is all open source and can be downloaded for free. Also the Meshcore phone app is free.

And to make your companion portable (optional, but fun):

- **Case:** You may want to make or buy a case. Heltec sells one as an optional extra to house the T114.
- **Battery:** To make your node portable, you need a 3.7v Li Po or Li Ion battery. I got a 350 mAh battery, but you can find batteries that last longer. 

### Setting up the device

![A LoRa board with Meshcore firmware displayed on its screen.](meshcore.jpg)

Setting up the device was easier than I thought, and it took me no more than half an hour before I was up and running.

> Want some help with how to set up your board? Tomorrow we’ll release a video getting started tutorial on the [Techwerkers youtube](https://www.youtube.com/@Techwerkers) that takes you through all steps from unboxing to sending your first message.

### What’s worked well

- With LoRa transmitters and Meshcore, members in the group have successfully sent and received direct messages, as well as messages in public and private channels. It worked both from home and also while hiking and roaming the streets. 
- When we started, we discovered that there’s an entire community out there already. The number of people using Meshcore is growing, which means coverage is constantly improving. On the [MeshCore node map](https://map.meshcore.dev/) you can check where people have set up Meshcore repeaters. In The Netherlands, coverage is already pretty good. 
- The process of setting this up was fun and rewarding. I have learnt a lot about radio communication, signal strength, and the various conditions that help or frustrate radio messages travelling far.

### Limitations

- Not all workers have been able to connect with all other workers. This is largely because repeater coverage isn’t everywhere guaranteed. 
- This communication network is still vulnerable in various ways. Given the open nature of the network, there’s a risk of it becoming clogged by spam and bots. The limited radio bandwidth it operates on might leave it easy to jam and interfere with.
- However low-powered they are, the LoRa devices still need electricity. Making them entirely off-grid with a battery and solar panel requires some tinkering, and many in the group are still tweaking things to get that right yet. (You probably just need a larger solar panel.)

## Conclusion

Taking control of your communication infrastructure matters, both practically and politically. But having a backup system in place does require some preparation. So start thinking about the infrastructure you use to communicate with comrades already now! For the Techwerkers x Extinction Rebellion - Justice Now! pilot, using LoRa radio transmitters and Meshcore software promises to be a viable solution.

If you want to give decentralised communication using LoRa a try, there’s a growing mesh network out there that you can connect to. Also when the internet is down.

*This guide is part of a LoRa mesh network communication pilot set up by Techwerkers in collaboration with [Extinction Rebellion Netherlands - Justice Now!](https://extinctionrebellion.nl/community/justice-now/).*