Twitter Bot Template:
=====================

A simple twitter bot template that can respond to mentions it receives.
This is based on https://github.com/edsu/anon


Installation and Todos:
----------------------

Make a copy of config.template.json and rename it config.json 
and fill your secret twitter keys and nick in it.

Complete the functions, "solve" and "isOfWrongFormat" in twitterBot.coffee

You can also compile coffeescript files to plain javascript using
the -c flag to coffee command

```sh
> npm install
> coffee twitterBot.coffee # to run the bot
> coffee -c twitterBot.coffee # to compile coffeescript to plain js to get twitterBot.js
```

If you prefer to work with plain javascript instead of coffee-script,
the plain javascript file is provided to you as well. Complete
the functions "solve" and "isOfWrongFormat" in twitterBot.js.

```sh
> node twitterBot.js # to run the bot
```
